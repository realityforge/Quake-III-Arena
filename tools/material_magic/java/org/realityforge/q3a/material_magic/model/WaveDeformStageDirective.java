package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class WaveDeformStageDirective
  extends DeformStageDirective<WaveDeformStageDirective>
{
  //moveFunc : MOVE x=number y=number z=number waveForm;
  private float _spread;
  @Nonnull
  private WaveForm _wave = new WaveForm();

  public float getSpread()
  {
    return _spread;
  }

  public void setSpread( final float spread )
  {
    _spread = spread;
  }

  @Nonnull
  public WaveForm getWave()
  {
    return _wave;
  }

  public void setWave( @Nonnull final WaveForm wave )
  {
    _wave = Objects.requireNonNull( wave );
  }

  @Override
  void write( @Nonnull final MaterialOutput output )
    throws IOException
  {
    output.writeDirective( "deformVertexes",
                           "wave",
                           Float.toString( _spread ),
                           _wave.toString() );
  }

  @Override
  protected boolean performEquals( @Nonnull final WaveDeformStageDirective other )
  {
    return _spread == other._spread && Objects.equals( _wave, other._wave );
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "move", _spread, _wave );
  }
}
