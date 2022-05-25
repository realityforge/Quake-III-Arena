package org.realityforge.q3a.material_magic.model;

import org.realityforge.q3a.material_magic.util.MaterialOutput;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.io.IOException;
import java.util.Objects;

public final class Material {
    @Nonnull
    private String _name;
    @Nullable
    private Q3mapProperties _q3map;

    public Material(@Nonnull final String name) {
        _name = Objects.requireNonNull(name);
    }

    @Nonnull
    public String getName() {
        return _name;
    }

    public void setName(@Nonnull final String name) {
        _name = Objects.requireNonNull(name);
    }

    public boolean hasQ3map() {
        return null != _q3map;
    }

    @Nonnull
    public Q3mapProperties q3map() {
        if (null == _q3map) {
            _q3map = new Q3mapProperties();
        }
        return _q3map;
    }

    public void setQ3map(@Nullable final Q3mapProperties q3map) {
        _q3map = q3map;
    }

    void write(@Nonnull final MaterialOutput output) throws IOException {
        output.writeMaterial(getName(), o -> {
            if (hasQ3map()) {
                q3map().write(o);
            }
        });
    }

    @Override
    public String toString() {
        return MaterialOutput.outputAsString(this::write);
    }
}
