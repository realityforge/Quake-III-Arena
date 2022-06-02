package org.realityforge.q3a.material_magic.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Objects;
import javax.annotation.Nonnull;

public final class MaterialOutput implements AutoCloseable
{
  public enum Strategy
  {
    /**
     * Optimise the output for consumption at runtime. Comments are removed, directives only used as
     * part of the build process are omitted and whitespace is minimised.
     */
    RUNTIME_OPTIMIZED,
    /**
     * All non-default values are emitted in output regardless of whether they are only used by the
     * build tools, the client or the engine..
     */
    PRETTY
  }

  @FunctionalInterface
  public interface Block {
    void call( @Nonnull MaterialOutput output ) throws IOException;
  }

  @Nonnull
  private final Strategy _strategy;
  @Nonnull
  private final OutputStream _outputStream;
  private int _indent;
  private boolean _emittedMaterial = false;

  @Nonnull
  public static String outputAsString( @Nonnull final Block body )
  {
    return outputAsString( body, Strategy.PRETTY );
  }

  @Nonnull
  public static String outputAsString( @Nonnull final Block body, @Nonnull final Strategy strategy )
  {
    try {
      final ByteArrayOutputStream baos = new ByteArrayOutputStream();
      final MaterialOutput output = new MaterialOutput( baos, strategy );
      body.call( output );
      final byte[] bytes = baos.toByteArray();
      return new String( bytes, 0, bytes.length, StandardCharsets.US_ASCII );
    } catch ( final IOException e ) {
      throw new RuntimeException( e );
    }
  }

  public MaterialOutput( @Nonnull final Path extensionFile, @Nonnull final Strategy strategy ) throws IOException
  {
    this( Files.newOutputStream( extensionFile.toFile().toPath() ), strategy );
  }

  public MaterialOutput( @Nonnull final OutputStream outputStream, @Nonnull final Strategy strategy )
  {
    _strategy = Objects.requireNonNull( strategy );
    _outputStream = Objects.requireNonNull( outputStream );
  }

  @Nonnull
  public Strategy getStrategy()
  {
    return _strategy;
  }

  public boolean shouldOmitNonRuntimeDirectives() { return Strategy.RUNTIME_OPTIMIZED == getStrategy(); }

  public boolean shouldPrettyPrint() { return Strategy.PRETTY == getStrategy(); }

  public void writeMaterial( @Nonnull final String label, @Nonnull final Block body ) throws IOException
  {
    if ( _emittedMaterial ) {
      if ( shouldPrettyPrint() ) {
        newLine();
      }
    } else {
      _emittedMaterial = true;
    }
    write( label );
    writeSection( body );
  }

  public void writeStage( @Nonnull final Block body ) throws IOException { writeSection( body ); }

  public void writeDirective( @Nonnull final String name, @Nonnull final String... arguments ) throws IOException
  {
    write( name + ( 0 == arguments.length ? "" : " " + String.join( " ", arguments ) ) );
  }

  private void writeSection( @Nonnull final Block body ) throws IOException
  {
    write( "{" );
    incIndent();
    body.call( this );
    decIndent();
    write( "}" );
  }

  private void write( @Nonnull final String line ) throws IOException
  {
    if ( shouldPrettyPrint() ) {
      for ( int i = 0; i < _indent; i++ ) {
        emit( "  " );
      }
    }
    emit( line );
    newLine();
  }

  private void newLine() throws IOException { emit( "\n" ); }

  private void incIndent() { _indent++; }

  private void decIndent()
  {
    _indent--;
    assert _indent >= 0;
  }

  @Override
  public void close() throws IOException
  {
    _outputStream.close();
  }

  private void emit( @Nonnull final String string ) throws IOException
  {
    _outputStream.write( string.getBytes( StandardCharsets.US_ASCII ) );
  }
}
