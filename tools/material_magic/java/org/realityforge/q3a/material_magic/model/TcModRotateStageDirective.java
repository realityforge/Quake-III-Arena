package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class TcModRotateStageDirective extends TcModStageDirective<TcModRotateStageDirective>
{
  private float _degreesPerSecond;

  public float getDegreesPerSecond() { return _degreesPerSecond; }

  public void setDegreesPerSecond( final float degreesPerSecond ) { _degreesPerSecond = degreesPerSecond; }

  @Override
  public boolean isDefault()
  {
    return 0 == _degreesPerSecond;
  }

  @Override
  void performWrite( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "tcmod", "rotate", EmitUtil.floatToString( _degreesPerSecond ) );
  }

  @Override
  protected boolean performEquals( @Nonnull final TcModRotateStageDirective other )
  {
    return _degreesPerSecond == other._degreesPerSecond;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "tcmod", "rotate", _degreesPerSecond );
  }
}
