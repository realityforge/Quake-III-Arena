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

public final class FogDirective
{
  private float _red;
  private float _green;
  private float _blue;
  private int _depthForOpaque;

  public float getRed() { return _red; }

  public void setRed( final float red ) { _red = red; }

  public float getGreen() { return _green; }

  public void setGreen( final float green ) { _green = green; }

  public float getBlue() { return _blue; }

  public void setBlue( final float blue ) { _blue = blue; }

  public int getDepthForOpaque() { return _depthForOpaque; }

  public void setDepthForOpaque( final int depthForOpaque ) { _depthForOpaque = depthForOpaque; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "fogparms",
                           "(",
                           EmitUtil.floatToString( _red ),
                           EmitUtil.floatToString( _green ),
                           EmitUtil.floatToString( _blue ),
                           ")",
                           Integer.toString( _depthForOpaque ) );
  }

  @Override
  public boolean equals( final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( o == null || getClass() != o.getClass() ) {
      return false;
    } else {
      final FogDirective that = (FogDirective)o;
      return Float.compare( that._red, _red ) == 0 && Float.compare( that._green, _green ) == 0 &&
        Float.compare( that._blue, _blue ) == 0 && _depthForOpaque == that._depthForOpaque;
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( _red, _green, _blue, _depthForOpaque );
  }
}
