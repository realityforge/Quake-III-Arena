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
package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class TcGenStageDirective
{
  public enum CoordinateSource
  {
    BASE,
    LIGHTMAP,
    ENVIRONMENT;

    @Nullable
    public static CoordinateSource findByName( @Nonnull final String name )
    {
      return Arrays.stream( CoordinateSource.values() )
        .filter( value -> value.name().equals( name ) )
        .findFirst()
        .orElse( null );
    }
  }

  @Nonnull
  private CoordinateSource _coordinateSource = CoordinateSource.BASE;

  public boolean isDefault() { return CoordinateSource.BASE == _coordinateSource; }

  @Nonnull
  public CoordinateSource getCoordinateSource()
  {
    return _coordinateSource;
  }

  public void setCoordinateSource( @Nonnull final CoordinateSource coordinateSource )
  {
    _coordinateSource = Objects.requireNonNull( coordinateSource );
  }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    if ( !isDefault() ) {
      output.writeDirective( "tcGen", _coordinateSource.name().toLowerCase() );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "tcGen", _coordinateSource );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      return Objects.equals( _coordinateSource, ( (TcGenStageDirective)o )._coordinateSource );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
