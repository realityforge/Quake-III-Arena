package org.realityforge.q3a.material_magic.model.reader;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.LexerNoViableAltException;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.misc.ParseCancellationException;

import javax.annotation.Nonnull;

final class BailLexer extends MaterialsLexer {
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
