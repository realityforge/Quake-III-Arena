package org.realityforge.q3a.material_magic;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.Unit;
import org.realityforge.q3a.material_magic.model.reader.LoadError;
import org.realityforge.q3a.material_magic.model.reader.MaterialsReadException;
import org.realityforge.q3a.material_magic.model.reader.UnitReader;
import org.realityforge.q3a.material_magic.model.validator.ValidationMessage;
import org.realityforge.q3a.material_magic.model.validator.ValidationResult;
import org.realityforge.q3a.material_magic.model.validator.Validator;
import org.realityforge.q3a.material_magic.util.MaterialOutput;
import picocli.CommandLine;
import picocli.CommandLine.Command;

@SuppressWarnings( { "unused", "BooleanMethodIsAlwaysInverted" } )
@Command( name = "material_magick",
          mixinStandardHelpOptions = true,
          description = "Read and process shader/material files." )
public class Main implements Callable<Integer>
{
  @SuppressWarnings( "MismatchedQueryAndUpdateOfCollection" )
  @CommandLine.Option( names = { "-l", "--library-input-file" },
                       description = "The library input file(s) to load",
                       paramLabel = "L" )
  private List<Path> _libraryInput = new ArrayList<>();
  @SuppressWarnings( "MismatchedQueryAndUpdateOfCollection" )
  @CommandLine.Option( names = { "-i", "--input-file" },
                       description = "The input file(s) to load",
                       paramLabel = "I",
                       required = true )
  private List<Path> _input = new ArrayList<>();
  @CommandLine.Option( names = { "-o", "--output-file" }, description = "The file to save unit to", paramLabel = "O" )
  private Path _output;
  @CommandLine.Option( names = { "-d", "--output-directory" },
                       description = "The directory in which to save shaders. One file per material",
                       paramLabel = "D" )
  private Path _outputDirectory;
  @CommandLine.Option( names = { "--optimize" },
                       description = "Optimize the unit for loading by the engine by stripping tooling data",
                       arity = "0" )
  private boolean _optimize;
  @CommandLine.Option( names = { "--identity-transform" },
                       description = "Attempt to perform the identity transform and verify the pre-transform and"
                                     + " post-transform match. This is done for every unit after loading and every unit"
                                     + " prior to saving. This primarily used to verify the integrity of the tool.",
                       arity = "0" )
  private boolean _identityTransform;
  @CommandLine.Option( names = { "--no-verify" }, description = "Skip validation of input unit.", arity = "0" )
  private boolean _noVerify;
  @CommandLine.Option( names = { "--verbose" }, description = "Verbose output.", arity = "0" )
  private boolean _verbose;
  @SuppressWarnings( "MismatchedQueryAndUpdateOfCollection" )
  @CommandLine.Option(
    names = { "--allowed-material-override" },
    description = "The name of a material that the input file(s) can define that also appears in the library file(s)",
    paramLabel = "M" )
  private Set<String> _allowedOverrides = new HashSet<>();

  @Override
  public Integer call() throws Exception
  {
    final Unit unit = loadInputs( _input );
    if ( null == unit ) {
      return 1;
    }
    final Unit libraryUnit = _libraryInput.isEmpty() ? new Unit() : loadInputs( _libraryInput );
    if ( null == libraryUnit ) {
      return 1;
    }

    if ( !_noVerify ) {
      final Validator validator = new Validator();
      final ValidationResult result = validator.validate( unit, libraryUnit, _allowedOverrides );
      final boolean hasError = result.hasErrorMessages();
      if ( hasError ) {
        System.err.println( "Input material definition file(s) failed to validate." );
      }
      final List<ValidationMessage> messages = result.getMessages();
      messages.stream().filter( m -> ValidationMessage.Type.ERROR == m.getType() ).forEach( System.err::println );
      messages.stream().filter( m -> ValidationMessage.Type.WARNING == m.getType() ).forEach( System.err::println );
      if ( _verbose ) {
        messages.stream().filter( m -> ValidationMessage.Type.INFO == m.getType() ).forEach( System.err::println );
      }
      if ( hasError ) {
        return 1;
      }
    }

    if ( null != _output ) {
      if ( !writeUnit( _output, unit ) ) {
        return 1;
      }
    }

    if ( null != _outputDirectory ) {
      for ( final Material material : unit.getMaterials() ) {
        final Unit newUnit = new Unit();
        newUnit.addMaterial( material );
        if ( !writeUnit( _outputDirectory.resolve( material.getName().replace( " ", "_" ) + Unit.EXTENSION ),
                         newUnit ) ) {
          return 1;
        }
      }
    }

    if ( null == _output && null == _outputDirectory ) {
      System.out.print( unit );
    }
    return 0;
  }

  private boolean writeUnit( @Nonnull final Path path, @Nonnull final Unit unit )
  {
    if ( _identityTransform && !verifyIdentityTransform( path, unit ) ) {
      return false;
    } else {
      try {
        final Path directory = path.getParent();
        if ( !Files.exists( directory ) ) {
          Files.createDirectories( directory );
        }
        final ByteArrayOutputStream baos = new ByteArrayOutputStream();
        final MaterialOutput.Strategy strategy =
          _optimize ? MaterialOutput.Strategy.RUNTIME_OPTIMIZED : MaterialOutput.Strategy.PRETTY;
        unit.write( new MaterialOutput( baos, strategy ) );
        Files.write( path, baos.toByteArray() );
      } catch ( final IOException ioe ) {
        System.err.println( "Failed to write output file " + path + " due to " + ioe );
        return false;
      }
    }
    return true;
  }

  @Nullable
  private Unit loadInputs( @Nonnull final List<Path> files )
  {
    final List<Unit> units = new ArrayList<>();
    for ( final Path input : files ) {
      final Unit unit = loadUnit( input );
      if ( null == unit ) {
        return null;
      } else {
        if ( _identityTransform && !verifyIdentityTransform( input, unit ) ) {
          return null;
        }
        units.add( unit );
      }
    }
    if ( 1 != units.size() ) {
      return merge( units );
    } else {
      return units.get( 0 );
    }
  }

  private boolean verifyIdentityTransform( @Nonnull final Path file, @Nonnull final Unit unit )
  {
    final Unit transformedUnit;
    try {
      transformedUnit = UnitReader.readFromString( unit.toString() );
    } catch ( final MaterialsReadException e ) {
      System.err.println( "Error: Invalid unit when checking identity transform of file " + file );
      for ( final LoadError syntaxError : e.getSyntaxErrors() ) {
        System.err.println( syntaxError.toString( file.toString() ) );
      }
      return false;
    }
    if ( !transformedUnit.equals( unit ) ) {
      System.err.println( "Identity transform for file " + file + " failed to produce identical output." );
      System.err.println( "Original unit source:" );
      System.err.println( "--------------------------------------------------------------------------------" );
      System.err.print( unit );
      System.err.println( "--------------------------------------------------------------------------------" );
      System.err.println( "Transformed unit source:" );
      System.err.println( "--------------------------------------------------------------------------------" );
      System.err.print( transformedUnit );
      System.err.println( "--------------------------------------------------------------------------------" );
      return false;
    } else {
      return true;
    }
  }

  @Nonnull
  private Unit merge( @Nonnull final List<Unit> units )
  {
    final Unit unit = new Unit();
    units.forEach( u -> u.getMaterials().forEach( unit::addMaterial ) );
    return unit;
  }

  /**
   * Load a unit from the specified file. Emit errors to stderr and return null on error.
   *
   * @param path the file to load.
   * @return the loaded unit or null if the load failed.
   */
  @Nullable
  private Unit loadUnit( @Nonnull final Path path )
  {
    try {
      return UnitReader.fromPath( path );
    } catch ( final MaterialsReadException e ) {
      System.err.println( "Error: Invalid input file " + path );
      for ( final LoadError syntaxError : e.getSyntaxErrors() ) {
        System.err.println( syntaxError.toString( path.toString() ) );
      }
      return null;
    } catch ( final IOException ioe ) {
      System.err.println( "Error: Failed to read input file " + path );
      return null;
    }
  }

  public static void main( @Nonnull final String... args )
  {
    System.exit( new CommandLine( new Main() ).execute( args ) );
  }
}
