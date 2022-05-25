package org.realityforge.q3a.material_magic.model.reader;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.ParseCancellationException;

import javax.annotation.Nonnull;
import java.io.IOException;
import java.nio.file.Path;

final class MaterialsParserTool {
    private MaterialsParserTool() {
    }

    /**
     * Create a parser instance to read from specified file.
     * The parser is configured to generate an exception if a lexing or parse exception is detected.
     *
     * @param path the filename to read input from.
     * @return the configured parser instance.
     * @throws IOException if there is an error reading from reader.
     * @see #createParser(CharStream, RecordingErrorListener)
     */
    @Nonnull
    static MaterialsParser createParser(@Nonnull final Path path, @Nonnull final RecordingErrorListener errorListener) throws IOException {
        return createParser(CharStreams.fromPath(path), errorListener);
    }

    /**
     * Create a parser instance to read from input stream.
     * The parser is configured to generate an exception if a lexing or parse exception is detected.
     *
     * @param input the filename to read input from.
     * @return the configured parser instance.
     */
    @Nonnull
    static MaterialsParser createParser(@Nonnull final CharStream input, @Nonnull final RecordingErrorListener errorListener) {
        final MaterialsParser parser = new MaterialsParser(new CommonTokenStream(new BailLexer(input)));
        parser.getErrorListeners().clear();
        parser.addErrorListener(errorListener);
        return parser;
    }

    private static class BailLexer extends MaterialsLexer {
        BailLexer(@Nonnull final CharStream input) {
            super(input);
        }

        @Override
        public void recover(@Nonnull final RecognitionException re) {
            throw new ParseCancellationException(re);
        }

        @Override
        public void recover(@Nonnull final LexerNoViableAltException e) {
            throw new ParseCancellationException(e);
        }
    }
}
