package org.realityforge.q3a.material_magic.model.reader;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.Objects;

public final class LoadError {
    @Nonnull
    private final String _file;
    private final int _line;
    private final int _charPositionInLine;
    @Nonnull
    private final String _message;

    public LoadError(@Nonnull final String file, final int line, final int charPositionInLine, @Nonnull final String message) {
        _file = Objects.requireNonNull(file);
        _line = line;
        _charPositionInLine = charPositionInLine;
        _message = Objects.requireNonNull(message);
    }

    @Nonnull
    public String getFile() {
        return _file;
    }

    public int getLine() {
        return _line;
    }

    public int getCharPositionInLine() {
        return _charPositionInLine;
    }

    @Nonnull
    public String getMessage() {
        return _message;
    }

    @Nonnull
    public String toString(@Nullable final String file) {
        return "syntax error: " + (null == file ? "" : file + ":") + getLine() + ":" + getCharPositionInLine() + " " + getMessage();
    }

    @Nonnull
    @Override
    public String toString() {
        return toString(null);
    }
}
