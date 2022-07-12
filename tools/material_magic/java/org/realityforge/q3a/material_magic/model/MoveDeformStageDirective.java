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

public final class MoveDeformStageDirective extends DeformStageDirective<MoveDeformStageDirective>
{
  private float _x;
  private float _y;
  private float _z;
  @Nonnull
  private WaveForm _wave = new WaveForm();

  public float getX() { return _x; }

  public void setX( final float x ) { _x = x; }

  public float getY() { return _y; }

  public void setY( final float y ) { _y = y; }

  public float getZ() { return _z; }

  public void setZ( final float z ) { _z = z; }

  @Nonnull
  public WaveForm getWave()
  {
    return _wave;
  }

  public void setWave( @Nonnull final WaveForm wave ) { _wave = Objects.requireNonNull( wave ); }

  @Override
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "deformVertexes",
                           "move",
                           EmitUtil.floatToString( _x ),
                           EmitUtil.floatToString( _y ),
                           EmitUtil.floatToString( _z ),
                           _wave.toString() );
  }

  @Override
  protected boolean performEquals( @Nonnull final MoveDeformStageDirective other )
  {
    return _x == other._x && _y == other._y && _z == other._z && Objects.equals( _wave, other._wave );
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "move", _x, _y, _z, _wave );
  }
}
