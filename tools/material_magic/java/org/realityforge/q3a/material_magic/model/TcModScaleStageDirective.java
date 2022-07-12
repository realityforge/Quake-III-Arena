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

public final class TcModScaleStageDirective extends TcModStageDirective<TcModScaleStageDirective>
{
  private float _sScale = 1;
  private float _tScale = 1;

  public float getSScale() { return _sScale; }

  public void setSScale( final float sScale ) { _sScale = sScale; }

  public float getTScale() { return _tScale; }

  public void setTScale( final float tScale ) { _tScale = tScale; }

  @Override
  public boolean isDefault()
  {
    return 1 == _sScale && 1 == _tScale;
  }

  @Override
  void performWrite( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "tcmod", "scale", EmitUtil.floatToString( _sScale ), EmitUtil.floatToString( _tScale ) );
  }

  @Override
  protected boolean performEquals( @Nonnull final TcModScaleStageDirective other )
  {
    return _sScale == other._sScale && _tScale == other._tScale;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "tcmod", "scale", _sScale, _tScale );
  }
}
