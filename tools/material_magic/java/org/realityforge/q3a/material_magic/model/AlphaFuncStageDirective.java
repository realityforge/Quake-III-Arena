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

public final class AlphaFuncStageDirective
{
  public enum AlphaFunc
  {
    GT0,
    LT128,
    GE128;

    @Nullable
    public static AlphaFunc findByName( @Nonnull final String name )
    {
      return Arrays.stream( AlphaFunc.values() )
        .filter( value -> value.name().equals( name ) )
        .findFirst()
        .orElse( null );
    }
  }

  @Nullable
  private AlphaFunc _func;

  public boolean isDefault() { return null == _func; }

  @Nullable
  public AlphaFunc getFunc()
  {
    return _func;
  }

  public void setFunc( @Nullable final AlphaFunc func ) { _func = func; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    if ( !isDefault() ) {
      output.writeDirective( "alphaFunc", _func.name() );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "clampmap", _func );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      return Objects.equals( _func, ( (AlphaFuncStageDirective)o )._func );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
