/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.realityforge.q3a.material_magic.model.reader;

import javax.annotation.Nonnull;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.LexerNoViableAltException;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.misc.ParseCancellationException;

final class BailLexer extends MaterialsLexer
{
  BailLexer( @Nonnull final CharStream input ) { super( input ); }

  @Override
  public void recover( @Nonnull final RecognitionException re )
  {
    throw new ParseCancellationException( re );
  }

  @Override
  public void recover( @Nonnull final LexerNoViableAltException e )
  {
    throw new ParseCancellationException( e );
  }
}
