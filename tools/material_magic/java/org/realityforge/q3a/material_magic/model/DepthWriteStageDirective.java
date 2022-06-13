package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class DepthWriteStageDirective
{
  void write( @Nonnull final MaterialOutput output ) throws IOException { output.writeDirective( "depthWrite" ); }

  @Override
  public int hashCode()
  {
    return Objects.hash( "depthWrite" );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    return this == o || null != o && getClass() == o.getClass();
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
