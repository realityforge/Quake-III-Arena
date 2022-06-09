package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class DepthFuncStageDirective
{
  // True implies equal, false implies less than or equal
  private boolean _equal;

  public boolean isDefault() { return !_equal; }

  public boolean isEqual() { return _equal; }

  public void setEqual( final boolean equal ) { _equal = equal; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "depthFunc", _equal ? "equal" : "lequal" );
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "depthFunc", _equal );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      return Objects.equals( _equal, ( (DepthFuncStageDirective)o )._equal );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
