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

import java.util.Objects;
import javax.annotation.Nonnull;

final class Error
{
  private final int _line;
  private final int _charPositionInLine;
  @Nonnull
  private final String _message;

  Error( final boolean syntax, final int line, final int charPositionInLine, @Nonnull final String message )
  {
    _line = line;
    _charPositionInLine = charPositionInLine;
    _message = Objects.requireNonNull( message );
  }

  int getLine() { return _line; }

  int getCharPositionInLine() { return _charPositionInLine; }

  @Nonnull
  String getMessage()
  {
    return _message;
  }

  @Nonnull
  @Override
  public String toString()
  {
    return "syntax error: " + getLine() + ":" + getCharPositionInLine() + " " + getMessage();
  }
}
