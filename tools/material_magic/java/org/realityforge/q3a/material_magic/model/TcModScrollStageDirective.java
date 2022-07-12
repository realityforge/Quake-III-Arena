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
