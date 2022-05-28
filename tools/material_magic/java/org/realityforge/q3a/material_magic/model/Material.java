package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class Material {
    @Nonnull
    private String _name;
    @Nullable
    private Q3mapProperties _q3map;
    @Nullable
    private QerProperties _qer;
    @Nonnull
    private CullType _cull = CullType.FRONT;
    @Nonnull
    private Set<SurfaceParameter> _surfaceProperties = new HashSet<>();

    public Material(@Nonnull final String name)
    {
        _name = Objects.requireNonNull(name);
    }

    @Nonnull
    public String getName()
    {
        return _name;
    }

    public void setName(@Nonnull final String name)
    {
        _name = Objects.requireNonNull(name);
    }

    public boolean hasQ3map()
    {
        return null != _q3map;
    }

    @Nonnull
    public Q3mapProperties q3map()
    {
        if (null == _q3map) {
            _q3map = new Q3mapProperties();
        }
        return _q3map;
    }

    public boolean hasQer()
    {
        return null != _qer;
    }

    @Nonnull
    public QerProperties qer()
    {
        if (null == _qer) {
            _qer = new QerProperties();
        }
        return _qer;
    }

    @Nonnull
    public CullType getCull()
    {
        return _cull;
    }

    public void setCull(@Nonnull final CullType cull)
    {
        _cull = Objects.requireNonNull(cull);
    }

    @Nonnull
    public Set<SurfaceParameter> getSurfaceProperties()
    {
        return _surfaceProperties;
    }
    @Nonnull
    public List<SurfaceParameter> getSurfacePropertiesSorted()
    {
        return _surfaceProperties.stream().sorted().collect(Collectors.toUnmodifiableList());
    }

    /**
     * Write the material using the standard text serialization mechanisms to the specified output object.
     *
     * @param output the output object to emit material to.
     * @throws IOException if there is an error writing to MaterialOutput
     */
    void write(@Nonnull final MaterialOutput output) throws IOException
    {
        output.writeMaterial(getName(), o -> {
            if (hasQ3map()) {
                q3map().write(o);
            }
            if (hasQer()) {
                qer().write(o);
            }
            if (CullType.FRONT != _cull) {
                o.writeProperty("cull", CullType.BACK == _cull ? "back" : "disable");
            }
            for (final SurfaceParameter surfaceProperty : getSurfacePropertiesSorted()) {
                o.writeProperty("surfaceparm", surfaceProperty.name());
            }
        });
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o) {
            return true;
        } else if (o == null || getClass() != o.getClass()) {
            return false;
        } else {
            final Material that = (Material)o;
            return _name.equals(that._name) && _cull.equals(that._cull) && Objects.equals(getSurfacePropertiesSorted(), that.getSurfacePropertiesSorted()) && Objects.equals(q3map(), that.q3map()) && Objects.equals(qer(), that.qer());
        }
    }

    @Override
    public int hashCode()
    {
        return Objects.hash(_name, _cull, getSurfacePropertiesSorted(), q3map(), qer());
    }

    @Nonnull
    @Override
    public String toString()
    {
        return MaterialOutput.outputAsString(this::write);
    }
}
