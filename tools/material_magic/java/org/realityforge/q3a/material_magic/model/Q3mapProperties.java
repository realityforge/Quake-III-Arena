package org.realityforge.q3a.material_magic.model;

import org.realityforge.q3a.material_magic.util.MaterialOutput;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.io.IOException;
import java.util.Objects;

public final class Q3mapProperties {
    private boolean _globalTexture;
    private boolean _forceSunLight;
    private boolean _noVertexShadows;
    private boolean _light;
    // A positive value
    private int _surfaceLight;
    @Nullable
    private String _lightImage;

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

    public boolean light() {
        return _light;
    }

    public void setLight(final boolean light) {
        _light = light;
    }

    public int getSurfaceLight() {
        return _surfaceLight;
    }

    public void setSurfaceLight(final int surfaceLight) {
        _surfaceLight = surfaceLight;
    }

    @Nullable
    public String getLightImage() {
        return _lightImage;
    }

    public void setLightImage(@Nullable final String lightImage) {
        _lightImage = lightImage;
    }

    void write(@Nonnull final MaterialOutput output) throws IOException {
        if (!output.shouldOmitNonRuntimeProperties()) {
            if (0 != _surfaceLight) {
                output.writeProperty("q3map_surfacelight", Integer.toString(_surfaceLight));
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
            if (_light) {
                output.writeProperty("light", "1");
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
                    _light == that._light &&
                    _surfaceLight == that._surfaceLight &&
                    Objects.equals(_lightImage, that._lightImage);
        }
    }

    @Override
    public int hashCode() {
        return Objects.hash(_globalTexture, _forceSunLight, _noVertexShadows, _light, _surfaceLight, _lightImage);
    }
}
