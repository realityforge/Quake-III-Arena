package org.realityforge.q3a.material_magic.model.reader;

import javax.annotation.Nonnull;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

public final class MaterialsReadException extends IOException {
    @Nonnull
    private final List<LoadError> _syntaxErrors;

    public MaterialsReadException(@Nonnull final List<LoadError> syntaxErrors) {
        _syntaxErrors = Objects.requireNonNull(syntaxErrors);
    }

    @Nonnull
    public List<LoadError> getSyntaxErrors() {
        return _syntaxErrors;
    }
}
