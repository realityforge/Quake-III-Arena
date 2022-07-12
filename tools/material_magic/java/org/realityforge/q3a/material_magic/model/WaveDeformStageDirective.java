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

public final class WaveDeformStageDirective extends DeformStageDirective<WaveDeformStageDirective>
{
  private float _spread;
  @Nonnull
  private WaveForm _wave = new WaveForm();

  public float getSpread() { return _spread; }

  public void setSpread( final float spread ) { _spread = spread; }

  @Nonnull
  public WaveForm getWave()
  {
    return _wave;
  }

  public void setWave( @Nonnull final WaveForm wave ) { _wave = Objects.requireNonNull( wave ); }

  @Override
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "deformVertexes", "wave", EmitUtil.floatToString( _spread ), _wave.toString() );
  }

  @Override
  protected boolean performEquals( @Nonnull final WaveDeformStageDirective other )
  {
    return _spread == other._spread && Objects.equals( _wave, other._wave );
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "wave", _spread, _wave );
  }
}
