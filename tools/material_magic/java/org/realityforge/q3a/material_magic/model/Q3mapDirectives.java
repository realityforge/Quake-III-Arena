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
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class Q3mapDirectives
{
  public static final int DEFAULT_BACKSPLASH_PERCENT = 5;
  public static final int DEFAULT_BACKSPLASH_DISTANCE = 16;
  private boolean _globalTexture;
  private boolean _forceSunLight;
  private boolean _noVertexShadows;
  // A positive value or 0 to omit
  private int _surfaceLight;
  // A positive value or 0 to omit
  private int _lightSubDivide;
  // subdivisions
  private int _tessSize;
  private int _backSplashPercent = DEFAULT_BACKSPLASH_PERCENT;
  private int _backSplashDistance = DEFAULT_BACKSPLASH_DISTANCE;
  @Nullable
  private String _lightImage;
  @Nullable
  private String _flare;
  @Nullable
  private SunDirective _sun;

  public boolean globalTexture() { return _globalTexture; }

  public void setGlobalTexture( final boolean globalTexture ) { _globalTexture = globalTexture; }

  public boolean forceSunLight() { return _forceSunLight; }

  public void setForceSunLight( final boolean forceSunLight ) { _forceSunLight = forceSunLight; }

  public boolean noVertexShadows() { return _noVertexShadows; }

  public void setNoVertexShadows( final boolean noVertexShadows ) { _noVertexShadows = noVertexShadows; }

  public int getSurfaceLight() { return _surfaceLight; }

  public void setSurfaceLight( final int surfaceLight ) { _surfaceLight = surfaceLight; }

  public int getLightSubDivide() { return _lightSubDivide; }

  public void setLightSubDivide( final int lightSubDivide ) { _lightSubDivide = lightSubDivide; }

  public int getTessSize() { return _tessSize; }

  public void setTessSize( final int tessSize ) { _tessSize = tessSize; }

  public int getBackSplashPercent() { return _backSplashPercent; }

  public void setBackSplashPercent( final int backSplashPercent ) { _backSplashPercent = backSplashPercent; }

  public int getBackSplashDistance() { return _backSplashDistance; }

  public void setBackSplashDistance( final int backSplashDistance ) { _backSplashDistance = backSplashDistance; }

  @Nullable
  public String getLightImage()
  {
    return _lightImage;
  }

  public void setLightImage( @Nullable final String lightImage ) { _lightImage = lightImage; }

  @Nullable
  public String getFlare()
  {
    return _flare;
  }

  public void setFlare( @Nullable final String flare ) { _flare = flare; }

  @Nullable
  public SunDirective getSun()
  {
    return _sun;
  }

  public void setSun( @Nullable final SunDirective sun ) { _sun = sun; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    if ( null != _sun ) {
      _sun.write( output );
    }
    if ( !output.shouldOmitNonRuntimeDirectives() ) {
      if ( 0 != _surfaceLight ) {
        output.writeDirective( "q3map_surfacelight", Integer.toString( _surfaceLight ) );
      }
      if ( 0 != _lightSubDivide ) {
        output.writeDirective( "q3map_lightsubdivide", Integer.toString( _lightSubDivide ) );
      }
      if ( null != _lightImage ) {
        output.writeDirective( "q3map_lightimage", _lightImage );
      }
      if ( _globalTexture ) {
        output.writeDirective( "q3map_globaltexture" );
      }
      if ( _noVertexShadows ) {
        output.writeDirective( "q3map_novertexshadows" );
      }
      if ( _forceSunLight ) {
        output.writeDirective( "q3map_forcesunlight" );
      }
      if ( null != _flare ) {
        output.writeDirective( "q3map_flare", _flare );
      }
      if ( DEFAULT_BACKSPLASH_PERCENT != _backSplashPercent || DEFAULT_BACKSPLASH_DISTANCE != _backSplashDistance ) {
        output.writeDirective(
          "q3map_backsplash", Integer.toString( _backSplashPercent ), Integer.toString( _backSplashDistance ) );
      }
      if ( 0 != _tessSize ) {
        output.writeDirective( "tesssize", Integer.toString( _tessSize ) );
      }
    }
  }

  @Override
  public boolean equals( final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( o == null || getClass() != o.getClass() ) {
      return false;
    } else {
      final Q3mapDirectives that = (Q3mapDirectives)o;
      return _globalTexture == that._globalTexture && _forceSunLight == that._forceSunLight &&
        _noVertexShadows == that._noVertexShadows && _surfaceLight == that._surfaceLight &&
        _lightSubDivide == that._lightSubDivide && _tessSize == that._tessSize &&
        _backSplashPercent == that._backSplashPercent && _backSplashDistance == that._backSplashDistance &&
        Objects.equals( _lightImage, that._lightImage ) && Objects.equals( _flare, that._flare ) &&
        Objects.equals( _sun, that._sun );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( _globalTexture,
                         _forceSunLight,
                         _noVertexShadows,
                         _surfaceLight,
                         _lightSubDivide,
                         _tessSize,
                         _backSplashPercent,
                         _backSplashDistance,
                         _lightImage,
                         _flare,
                         _sun );
  }
}
