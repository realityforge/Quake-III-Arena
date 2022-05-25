package org.realityforge.q3a.material_magic.model.reader;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * An error listener that can be used within tests that will fail with an assertion error if there is a parsing error.
 */
final class RecordingErrorListener
        extends BaseErrorListener {
    public static class Error {
        private final int _line;
        private final int _charPositionInLine;
        @Nonnull
        private final String _message;

        public Error(final int line, final int charPositionInLine, @Nonnull final String message) {
            _line = line;
            _charPositionInLine = charPositionInLine;
            _message = Objects.requireNonNull(message);
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

        @Override
        public String toString() {
            return toString(null);
        }
    }

    @Nonnull
    private final List<Error> _errors = new ArrayList<>();

    @Nonnull
    public List<Error> getErrors() {
        return _errors;
    }

    @Override
    public void syntaxError(final Recognizer<?, ?> recognizer,
                            final Object offendingSymbol,
                            final int line,
                            final int charPositionInLine,
                            final String msg,
                            final RecognitionException e) {
        _errors.add(new Error(line, charPositionInLine, msg));
    }
}
