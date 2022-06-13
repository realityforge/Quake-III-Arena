package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class RgbGenStageDirective
{
  public enum Func
  {
    identity,
    identityLighting,
    vertex,
    exactVertex,
    entity,
    oneMinusEntity,
    lightingDiffuse,
    wave;

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

  public boolean isDefault()
  {
    // If no rgbGen is specified, either "identityLighting" or "identity" will be selected, depending on which blend
    // modes are used.
    return null == _func || ( Func.wave == _func && null == _wave );
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

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    if ( !isDefault() ) {
      if ( Func.wave == _func ) {
        output.writeDirective( "rgbGen", _func.name(), _wave.toString() );
      } else {
        output.writeDirective( "rgbGen", _func.name() );
      }
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "rgbGen", _func, Func.wave == _func ? _wave : null );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      final RgbGenStageDirective that = (RgbGenStageDirective)o;
      return Objects.equals( _func, that._func ) &&
        Objects.equals( Func.wave == _func ? _wave : null, Func.wave == that._func ? that._wave : null );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
