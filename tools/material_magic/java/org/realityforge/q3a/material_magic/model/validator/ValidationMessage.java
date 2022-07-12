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
package org.realityforge.q3a.material_magic.model.validator;

import java.util.Objects;
import javax.annotation.Nonnull;

public final class ValidationMessage
{
  public enum Type
  {
    ERROR,
    WARNING,
    INFO
  }

  @Nonnull
  private final Type _type;
  @Nonnull
  private final String _message;

  public ValidationMessage( @Nonnull final Type type, @Nonnull final String message )
  {
    _type = Objects.requireNonNull( type );
    _message = Objects.requireNonNull( message );
  }

  @Nonnull
  public Type getType()
  {
    return _type;
  }

  @Nonnull
  public String getMessage()
  {
    return _message;
  }

  @Override
  public boolean equals( final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( !( o instanceof ValidationMessage ) ) {
      return false;
    } else {
      final ValidationMessage that = (ValidationMessage)o;
      return _type == that._type && _message.equals( that._message );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( _type, _message );
  }

  @Override
  public String toString()
  {
    return _type + ": " + _message;
  }
}
