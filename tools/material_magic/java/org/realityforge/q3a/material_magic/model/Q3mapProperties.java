package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class Q3mapProperties {
    private boolean _globalTexture;
    private boolean _forceSunLight;
    private boolean _noVertexShadows;
    // A positive value or 0 to omit
    private int _surfaceLight;
    // A positive value or 0 to omit
    private int _lightSubDivide;
    // subdivisions
    private int _tessSize;
    @Nullable
    private String _lightImage;
    @Nullable
    private String _flare;

    public boolean globalTexture() {
        return _globalTexture;
    }

    public void setGlobalTexture(final boolean globalTexture) {
        _globalTexture = globalTexture;
    }

    public boolean forceSunLight() {
        return _forceSunLight;
    }

    public void setForceSunLight(final boolean forceSunLight) {
        _forceSunLight = forceSunLight;
    }

    public boolean noVertexShadows() {
        return _noVertexShadows;
    }

    public void setNoVertexShadows(final boolean noVertexShadows) {
        _noVertexShadows = noVertexShadows;
    }

    public int getSurfaceLight() {
        return _surfaceLight;
    }

    public void setSurfaceLight(final int surfaceLight) {
        _surfaceLight = surfaceLight;
    }

    public int getLightSubDivide()
    {
        return _lightSubDivide;
    }

    public void setLightSubDivide( final int lightSubDivide )
    {
        _lightSubDivide = lightSubDivide;
    }

    public int getTessSize()
    {
        return _tessSize;
    }

    public void setTessSize( final int tessSize )
    {
        _tessSize = tessSize;
    }

    @Nullable
    public String getLightImage() {
        return _lightImage;
    }

    public void setLightImage(@Nullable final String lightImage) {
        _lightImage = lightImage;
    }

    @Nullable
    public String getFlare() {
        return _flare;
    }

    public void setFlare(@Nullable final String flare) {
        _flare = flare;
    }

    void write(@Nonnull final MaterialOutput output) throws IOException {
        if (!output.shouldOmitNonRuntimeProperties()) {
            if (0 != _surfaceLight) {
                output.writeProperty("q3map_surfacelight", Integer.toString(_surfaceLight));
            }
            if (0 != _lightSubDivide) {
                output.writeProperty("q3map_lightsubdivide", Integer.toString(_lightSubDivide));
            }
            if (null != _lightImage) {
                output.writeProperty("q3map_lightimage", _lightImage);
            }
            if (_globalTexture) {
                output.writeProperty("q3map_globaltexture");
            }
            if (_noVertexShadows) {
                output.writeProperty("q3map_novertexshadows");
            }
            if (_forceSunLight) {
                output.writeProperty("q3map_forcesunlight");
            }
            if (null != _flare) {
                output.writeProperty("q3map_flare", _flare);
            }
            if (0 != _tessSize) {
                output.writeProperty("tesssize", Integer.toString(_tessSize));
            }
        }
    }

    @Override
    public boolean equals(final Object o) {
        if (this == o) {
            return true;
        } else if (o == null || getClass() != o.getClass()) {
            return false;
        } else {
            final Q3mapProperties that = (Q3mapProperties) o;
            return _globalTexture == that._globalTexture &&
                    _forceSunLight == that._forceSunLight &&
                    _noVertexShadows == that._noVertexShadows &&
                    _surfaceLight == that._surfaceLight &&
                   _lightSubDivide == that._lightSubDivide &&
                   _tessSize == that._tessSize &&
                    Objects.equals(_lightImage, that._lightImage) &&
                    Objects.equals(_flare, that._flare);
        }
    }

    @Override
    public int hashCode() {
        return Objects.hash( _globalTexture,
                             _forceSunLight,
                             _noVertexShadows,
                             _surfaceLight,
                             _lightSubDivide,
                             _tessSize,
                             _lightImage,
                             _flare );
    }
}
