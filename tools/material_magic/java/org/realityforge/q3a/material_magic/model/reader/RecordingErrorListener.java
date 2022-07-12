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

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nonnull;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.antlr.v4.runtime.misc.ParseCancellationException;

/**
 * An error listener that can be used within tests that will fail with an assertion error if there
 * is a parsing error.
 */
final class RecordingErrorListener extends BaseErrorListener
{
  @Nonnull
  private final List<Error> _errors = new ArrayList<>();

  @Nonnull
  List<Error> getErrors()
  {
    return _errors;
  }

  @Override
  public void syntaxError( final Recognizer<?, ?> recognizer,
                           final Object offendingSymbol,
                           final int line,
                           final int charPositionInLine,
                           final String msg,
                           final RecognitionException e )
  {
    _errors.add( new Error( true, line, charPositionInLine, msg ) );
    throw new ParseCancellationException();
  }
}
