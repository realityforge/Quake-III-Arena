package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class ClampMapStageDirective
{
  private String _texture;

  public boolean isDefault() { return null == _texture; }

  public String getTexture() { return _texture; }

  public void setTexture( @Nonnull final String texture ) { _texture = texture; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "clampmap", _texture );
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "clampmap", _texture );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      return Objects.equals( _texture, ( (ClampMapStageDirective)o )._texture );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
