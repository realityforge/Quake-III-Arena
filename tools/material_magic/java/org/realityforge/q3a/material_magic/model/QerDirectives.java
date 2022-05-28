package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class QerDirectives
{
    private boolean _noCarve;
    private float _transparency;
    @Nullable
    private String _editorImage;

    public boolean noCarve()
    {
        return _noCarve;
    }

    public void setNoCarve(final boolean noCarve)
    {
        _noCarve = noCarve;
    }

    public void setTransparency(final float transparency)
    {
        _transparency = transparency;
    }

    public float getTransparency()
    {
        return _transparency;
    }

    public void setEditorImage(@Nullable final String editorImage)
    {
        _editorImage = editorImage;
    }

    @Nullable
    public String getEditorImage()
    {
        return _editorImage;
    }

    void write(@Nonnull final MaterialOutput output) throws IOException
    {
        if (!output.shouldOmitNonRuntimeProperties()) {
            if (null != _editorImage) {
                output.writeDirective( "qer_editorimage", _editorImage);
            }
            if (_noCarve) {
                output.writeDirective( "qer_nocarve");
            }
            if (0F != _transparency) {
                output.writeDirective( "qer_trans", Float.toString( _transparency));
            }
        }
    }

    @Override
    public boolean equals(final Object o)
    {
        if (this == o) {
            return true;
        } else if (o == null || getClass() != o.getClass()) {
            return false;
        } else {
            final QerDirectives that = (QerDirectives)o;
            return _transparency == that._transparency && _noCarve == that._noCarve && Objects.equals(_editorImage, that._editorImage);
        }
    }

    @Override
    public int hashCode()
    {
        return Objects.hash(_transparency, _noCarve, _editorImage);
    }
}
