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

public class SunDirective
{
  private float _red;
  private float _green;
  private float _blue;
  private int _intensity;
  private int _degrees;
  private int _elevation;

  public float getRed() { return _red; }

  public void setRed( final float red ) { _red = red; }

  public float getGreen() { return _green; }

  public void setGreen( final float green ) { _green = green; }

  public float getBlue() { return _blue; }

  public void setBlue( final float blue ) { _blue = blue; }

  public int getIntensity() { return _intensity; }

  public void setIntensity( final int intensity ) { _intensity = intensity; }

  public int getDegrees() { return _degrees; }

  public void setDegrees( final int degrees ) { _degrees = degrees; }

  public int getElevation() { return _elevation; }

  public void setElevation( final int elevation ) { _elevation = elevation; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "q3map_sun",
                           EmitUtil.floatToString( _red ),
                           EmitUtil.floatToString( _green ),
                           EmitUtil.floatToString( _blue ),
                           Integer.toString( _intensity ),
                           Integer.toString( _degrees ),
                           Integer.toString( _elevation ) );
  }

  @Override
  public boolean equals( final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( o == null || getClass() != o.getClass() ) {
      return false;
    } else {
      final SunDirective that = (SunDirective)o;
      return Float.compare( that._red, _red ) == 0 && Float.compare( that._green, _green ) == 0 &&
        Float.compare( that._blue, _blue ) == 0 && _intensity == that._intensity && _degrees == that._degrees &&
        _elevation == that._elevation;
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( _red, _green, _blue, _intensity, _degrees, _elevation );
  }
}
