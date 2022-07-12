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

public final class NormalDeformStageDirective extends DeformStageDirective<NormalDeformStageDirective>
{
  private float _frequency;
  private float _amplitude;

  public float getFrequency() { return _frequency; }

  public void setFrequency( final float frequency ) { _frequency = frequency; }

  public float getAmplitude() { return _amplitude; }

  public void setAmplitude( final float amplitude ) { _amplitude = amplitude; }

  @Override
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective(
      "deformVertexes", "normal", EmitUtil.floatToString( _frequency ), EmitUtil.floatToString( _amplitude ) );
  }

  @Override
  protected boolean performEquals( @Nonnull final NormalDeformStageDirective other )
  {
    return _frequency == other._frequency && _amplitude == other._amplitude;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "normal", _frequency, _amplitude );
  }
}
