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

public final class TcModTransformStageDirective extends TcModStageDirective<TcModTransformStageDirective>
{
  private float _m00;
  private float _m01;
  private float _m10;
  private float _m11;
  private float _t0;
  private float _t1;

  public float getM00() { return _m00; }

  public void setM00( final float m00 ) { _m00 = m00; }

  public float getM01() { return _m01; }

  public void setM01( final float m01 ) { _m01 = m01; }

  public float getM10() { return _m10; }

  public void setM10( final float m10 ) { _m10 = m10; }

  public float getM11() { return _m11; }

  public void setM11( final float m11 ) { _m11 = m11; }

  public float getT0() { return _t0; }

  public void setT0( final float t0 ) { _t0 = t0; }

  public float getT1() { return _t1; }

  public void setT1( final float t1 ) { _t1 = t1; }

  @Override
  void performWrite( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "tcmod",
                           "transform",
                           EmitUtil.floatToString( _m00 ),
                           EmitUtil.floatToString( _m01 ),
                           EmitUtil.floatToString( _m10 ),
                           EmitUtil.floatToString( _m11 ),
                           EmitUtil.floatToString( _t0 ),
                           EmitUtil.floatToString( _t1 ) );
  }

  @Override
  protected boolean performEquals( @Nonnull final TcModTransformStageDirective other )
  {
    return _m00 == other._m00 && _m01 == other._m01 && _m10 == other._m10 && _m11 == other._m11 && _t0 == other._t0 &&
      _t1 == other._t1;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "tcmod", "transform", _m00, _m01, _m10, _m11, _t0, _t1 );
  }
}
