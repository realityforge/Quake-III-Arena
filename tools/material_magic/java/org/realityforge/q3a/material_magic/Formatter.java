/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.realityforge.q3a.material_magic;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.Callable;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
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
@Command( name = "mm_format",
          mixinStandardHelpOptions = true,
          description = "Read shader/material files and format or check the format of file." )
public class Formatter implements Callable<Integer>
{
  @SuppressWarnings( "MismatchedQueryAndUpdateOfCollection" )
  @CommandLine.Option( names = { "-i", "--input-file" },
                       description = "The input file(s) to load",
                       paramLabel = "I",
                       required = true )
  private List<Path> _input = new ArrayList<>();
  @CommandLine.Option( names = { "--optimize" },
                       description = "Ensure the material is optimised for runtime by stripping tooling data",
                       arity = "0" )
  private boolean _optimize;
  @CommandLine.Option( names = { "--verify" }, description = "Verify the input files.", arity = "0", negatable = true )
  private boolean _verify = true;
  @CommandLine.Option( names = { "--check-only" },
                       description = "Update the input file if it does not match the expected format.",
                       arity = "0" )
  private boolean _checkOnly;
  @CommandLine.Option( names = { "--verbose" }, description = "Verbose output.", arity = "0" )
  private boolean _verbose;

  @Override
  public Integer call() throws Exception
  {
    // If we are not running in "check-only" mode and we are running under bazel then format the files in
    // the actual workspace directory rather than in the runfiles location
    final String workspaceDirectory = _checkOnly ? null : System.getenv( "BUILD_WORKSPACE_DIRECTORY" );
    int exitCode = 0;
    final List<Unit> units = new ArrayList<>();
    for ( final Path input : _input ) {
      final Path file = null == workspaceDirectory ? input : Path.of( workspaceDirectory ).resolve( input );
      final Unit unit = loadUnit( file );
      if ( null == unit || !verifyIfRequired( file, unit ) ) {
        exitCode = 1;
      } else {
        // Convert unit to bytes
        final byte[] data = asBytes( unit );
        if ( !Arrays.equals( data, Files.readAllBytes( file ) ) ) {
          if ( !_checkOnly ) {
            if ( !writeFile( file, data ) ) {
              exitCode = 1;
            }
          } else {
            System.err.println( "Input material definition file " + file + " is not the correct format." );
            exitCode = 1;
          }
        }
      }
    }
    return exitCode;
  }

  private boolean verifyIfRequired( @Nonnull final Path input, @Nonnull final Unit unit )
  {
    boolean success = true;
    if ( _verify ) {
      final Validator validator = new Validator();
      final ValidationResult result = validator.validate( unit, new Unit(), new HashSet<>() );
      final boolean hasError = result.hasErrorMessages();
      if ( hasError ) {
        System.err.println( "Input material definition file " + input + " failed to validate." );
        success = false;
      }
      final List<ValidationMessage> messages = result.getMessages();
      messages.stream().filter( m -> ValidationMessage.Type.ERROR == m.getType() ).forEach( System.err::println );
      messages.stream().filter( m -> ValidationMessage.Type.WARNING == m.getType() ).forEach( System.err::println );
      if ( _verbose ) {
        messages.stream().filter( m -> ValidationMessage.Type.INFO == m.getType() ).forEach( System.err::println );
      }
    }
    return success;
  }

  private boolean writeFile( @Nonnull final Path path, @Nonnull final byte[] data )
  {
    try {
      final Path directory = path.getParent();
      if ( !Files.exists( directory ) ) {
        Files.createDirectories( directory );
      }
      Files.write( path, data );
    } catch ( final IOException ioe ) {
      System.err.println( "Failed to write output file " + path + " due to " + ioe );
      return false;
    }
    return true;
  }

  @Nonnull
  private byte[] asBytes( @Nonnull final Unit unit ) throws IOException
  {
    final ByteArrayOutputStream baos = new ByteArrayOutputStream();
    final MaterialOutput.Strategy strategy =
      _optimize ? MaterialOutput.Strategy.RUNTIME_OPTIMIZED : MaterialOutput.Strategy.PRETTY;
    unit.write( new MaterialOutput( baos, strategy ) );
    return baos.toByteArray();
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
    System.exit( new CommandLine( new Formatter() ).execute( args ) );
  }
}
