package org.realityforge.q3a.material_magic.model.reader;

import javax.annotation.Nonnull;
import java.util.Objects;

final class Error {
    private final int _line;
    private final int _charPositionInLine;
    @Nonnull
    private final String _message;

    Error(final boolean syntax, final int line, final int charPositionInLine, @Nonnull final String message) {
        _line = line;
        _charPositionInLine = charPositionInLine;
        _message = Objects.requireNonNull(message);
    }

    int getLine() {
        return _line;
    }

    int getCharPositionInLine() {
        return _charPositionInLine;
    }

    @Nonnull
    String getMessage() {
        return _message;
    }

    @Nonnull
    @Override
    public String toString() {
        return "syntax error: " + getLine() + ":" + getCharPositionInLine() + " " + getMessage();
    }
}
