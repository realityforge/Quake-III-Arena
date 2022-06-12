package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class TcModScrollStageDirective extends TcModStageDirective<TcModScrollStageDirective>
{
  private float _sSpeed = 1;
  private float _tSpeed = 1;

  public float getSSpeed() { return _sSpeed; }

  public void setSSpeed( final float sSpeed ) { _sSpeed = sSpeed; }

  public float getTSpeed() { return _tSpeed; }

  public void setTSpeed( final float tSpeed ) { _tSpeed = tSpeed; }

  @Override
  public boolean isDefault()
  {
    return 1 == _sSpeed && 1 == _tSpeed;
  }

  @Override
  void performWrite( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "tcmod", "scroll", EmitUtil.floatToString( _sSpeed ), EmitUtil.floatToString( _tSpeed ) );
  }

  @Override
  protected boolean performEquals( @Nonnull final TcModScrollStageDirective other )
  {
    return _sSpeed == other._sSpeed && _tSpeed == other._tSpeed;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "tcmod", "scroll", _sSpeed, _tSpeed );
  }
}
