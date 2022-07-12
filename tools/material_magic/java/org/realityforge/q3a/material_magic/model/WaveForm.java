/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.realityforge.q3a.material_magic.model;

import java.util.Arrays;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public final class WaveForm
{
  public enum Generator
  {
    SIN,
    SQUARE,
    TRIANGLE,
    SAWTOOTH,
    INVERSESAWTOOTH,
    NOISE;

    @Nullable
    public static Generator findByName( @Nonnull final String name )
    {
      return Arrays.stream( Generator.values() )
        .filter( value -> value.name().equals( name ) )
        .findFirst()
        .orElse( null );
    }
  }

  @Nonnull
  private Generator _generator = Generator.SIN;
  private float _base;
  private float _amplitude;
  private float _phase;
  private float _frequency;

  public boolean isDefault() { return 0 == _base && 0 == _amplitude; }

  @Nonnull
  public Generator getGenerator()
  {
    return _generator;
  }

  public void setGenerator( @Nonnull final Generator generator ) { _generator = Objects.requireNonNull( generator ); }

  public float getBase() { return _base; }

  public void setBase( final float base ) { _base = base; }

  public float getAmplitude() { return _amplitude; }

  public void setAmplitude( final float amplitude ) { _amplitude = amplitude; }

  public float getPhase() { return _phase; }

  public void setPhase( final float phase ) { _phase = phase; }

  public float getFrequency() { return _frequency; }

  public void setFrequency( final float frequency ) { _frequency = frequency; }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      final WaveForm that = (WaveForm)o;
      return _generator == that._generator && _base == that._base && _amplitude == that._amplitude &&
        _phase == that._phase && _frequency == that._frequency;
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( _generator, _base, _amplitude, _phase, _frequency );
  }

  @Override
  public String toString()
  {
    return _generator.name().toLowerCase() + " " + EmitUtil.floatToString( _base ) + " " +
      EmitUtil.floatToString( _amplitude ) + " " + EmitUtil.floatToString( _phase ) + " " +
      EmitUtil.floatToString( _frequency );
  }
}
