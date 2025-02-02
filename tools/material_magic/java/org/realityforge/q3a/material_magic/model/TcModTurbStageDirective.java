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

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class TcModTurbStageDirective extends TcModStageDirective<TcModTurbStageDirective>
{
  private float _base;
  private float _amplitude;
  private float _phase;
  private float _frequency;

  @Override
  public boolean isDefault()
  {
    return 0 == _base && 0 == _amplitude;
  }

  public float getBase() { return _base; }

  public void setBase( final float base ) { _base = base; }

  public float getAmplitude() { return _amplitude; }

  public void setAmplitude( final float amplitude ) { _amplitude = amplitude; }

  public float getPhase() { return _phase; }

  public void setPhase( final float phase ) { _phase = phase; }

  public float getFrequency() { return _frequency; }

  public void setFrequency( final float frequency ) { _frequency = frequency; }
  @Override
  void performWrite( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "tcmod",
                           "turb",
                           EmitUtil.floatToString( _base ),
                           EmitUtil.floatToString( _amplitude ),
                           EmitUtil.floatToString( _phase ),
                           EmitUtil.floatToString( _frequency ) );
  }

  @Override
  protected boolean performEquals( @Nonnull final TcModTurbStageDirective other )
  {
    return _base == other._base && _amplitude == other._amplitude && _phase == other._phase &&
      _frequency == other._frequency;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "tcmod", "turb", _base, _amplitude, _phase, _frequency );
  }
}
