package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public abstract class DeformStageDirective<T extends DeformStageDirective<T>>
{
  abstract void write( @Nonnull MaterialOutput output )
    throws IOException;

  @SuppressWarnings( "unchecked" )
  @Override

  public boolean equals( @Nullable final Object o )
  {
    if ( this == o )
    {
      return true;
    }
    else if ( null == o || getClass() != o.getClass() )
    {
      return false;
    }
    else
    {
      return performEquals( (T) o );
    }
  }

  protected abstract boolean performEquals( @Nonnull T other );

  @Override
  public abstract int hashCode();

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
