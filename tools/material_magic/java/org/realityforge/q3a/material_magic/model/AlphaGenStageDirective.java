package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class AlphaGenStageDirective
{
  public enum Func
  {
    lightingSpecular,
    wave,
    vertex,
    entity,
    portal;

    @Nullable
    public static Func findByName( @Nonnull final String name )
    {
      return Arrays.stream( Func.values() ).filter( value -> value.name().equals( name ) ).findFirst().orElse( null );
    }
  }

  @Nullable
  private Func _func;
  @Nullable
  private WaveForm _wave;
  private float _portalRange;

  public boolean isDefault()
  {
    return null == _func || ( Func.wave == _func && null == _wave ) || ( Func.portal == _func && 0.0F == _portalRange );
  }

  @Nullable
  public Func getFunc()
  {
    return _func;
  }

  public void setFunc( @Nullable final Func func ) { _func = func; }

  @Nullable
  public WaveForm getWave()
  {
    return _wave;
  }

  public void setWave( @Nullable final WaveForm wave ) { _wave = wave; }

  public float getPortalRange() { return _portalRange; }

  public void setPortalRange( final float portalRange ) { _portalRange = portalRange; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    if ( !isDefault() ) {
      if ( Func.wave == _func ) {
        output.writeDirective( "alphaGen", _func.name(), _wave.toString() );
      } else if ( Func.portal == _func ) {
        output.writeDirective( "alphaGen", _func.name(), EmitUtil.floatToString( _portalRange ) );
      } else {
        output.writeDirective( "alphaGen", _func.name() );
      }
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(
      "alphaGen", _func, Func.wave == _func ? _wave : null, Func.portal == _func ? _portalRange : null );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      final AlphaGenStageDirective that = (AlphaGenStageDirective)o;
      return Objects.equals( _func, that._func ) &&
        Objects.equals( Func.wave == _func ? _wave : null, Func.wave == that._func ? that._wave : null ) &&
        Objects.equals( Func.portal == _func ? _portalRange : null,
                        Func.portal == that._func ? that._portalRange : null );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
