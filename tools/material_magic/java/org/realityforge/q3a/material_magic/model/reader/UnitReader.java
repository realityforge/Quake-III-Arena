package org.realityforge.q3a.material_magic.model.reader;

import java.io.IOException;
import java.nio.file.Path;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.realityforge.q3a.material_magic.model.Unit;

public final class UnitReader
{
  /**
   * Read the unit from the specified text.
   *
   * @param text the content to be parsed.
   * @return the unit model.
   * @throws MaterialsReadException if there was an error parsing the material file.
   */
  @Nonnull
  public static Unit readFromString( @Nonnull final String text ) throws MaterialsReadException
  {
    return read( "<string>", CharStreams.fromString( text ) );
  }

  /**
   * Read the unit from the specified path.
   *
   * @param path the file to read materials from.
   * @return the unit model.
   * @throws MaterialsReadException if there was an error parsing the material file.
   * @throws IOException if there was an error reading the file from the path.
   */
  @Nonnull
  public static Unit fromPath( @Nonnull final Path path ) throws MaterialsReadException, IOException
  {
    return read( path.toString(), CharStreams.fromPath( path ) );
  }

  @Nonnull
  private static Unit read( @Nonnull final String source, @Nonnull final CharStream input )
    throws MaterialsReadException
  {
    final RecordingErrorListener errorListener = new RecordingErrorListener();
    final BailLexer lexer = new BailLexer( input );
    lexer.removeErrorListeners();
    lexer.addErrorListener( errorListener );
    final MaterialsParser parser = new MaterialsParser( new CommonTokenStream( lexer ) );
    parser.removeErrorListeners();
    parser.addErrorListener( errorListener );

    final ModelBuilderListener listener = new ModelBuilderListener();
    parser.addParseListener( listener );

    // Actually force a parse with the next line
    try {
      parser.unit();
    } catch ( final Throwable t ) {
      if ( errorListener.getErrors().isEmpty() ) {
        throw new MaterialsReadException(
          Collections.singletonList( new LoadError( source, 1, 1, "Unexpected error " + t ) ) );
      }
    }

    final List<Error> errors = errorListener.getErrors();
    if ( !errors.isEmpty() ) {
      throw new MaterialsReadException(
        errors.stream()
          .map( e -> new LoadError( source, e.getLine(), e.getCharPositionInLine(), e.getMessage() ) )
          .collect( Collectors.toList() ) );
    } else {
      return listener.getUnit();
    }
  }
}
