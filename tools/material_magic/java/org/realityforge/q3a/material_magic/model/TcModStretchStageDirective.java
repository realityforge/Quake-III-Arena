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

public final class TcModStretchStageDirective extends TcModStageDirective<TcModStretchStageDirective>
{
  @Nonnull
  private WaveForm _wave = new WaveForm();

  @Nonnull
  public WaveForm getWave()
  {
    return _wave;
  }

  public void setWave( @Nonnull final WaveForm wave ) { _wave = Objects.requireNonNull( wave ); }

  @Override
  public boolean isDefault()
  {
    return _wave.isDefault();
  }

  @Override
  void performWrite( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "tcmod", "stretch", _wave.toString() );
  }

  @Override
  protected boolean performEquals( @Nonnull final TcModStretchStageDirective other )
  {
    return Objects.equals( _wave, other._wave );
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "tcmod", "stretch", _wave );
  }
}
