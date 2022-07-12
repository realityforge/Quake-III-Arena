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

public final class BlendFuncStageDirective
{
  public enum SrcBlendMode
  {
    ONE,
    ZERO,
    DST_ZERO,
    DST_COLOR,
    ONE_MINUS_DST_COLOR,
    SRC_ALPHA,
    ONE_MINUS_SRC_ALPHA,
    DST_ALPHA,
    ONE_MINUS_DST_ALPHA,
    SRC_ALPHA_SATURATE;

    @Nullable
    public static SrcBlendMode findByName( @Nonnull final String name )
    {
      return Arrays.stream( SrcBlendMode.values() )
        .filter( value -> value.name().equals( name ) )
        .findFirst()
        .orElse( null );
    }
  }

  public enum DstBlendMode
  {
    ONE,
    ZERO,
    SRC_ALPHA,
    ONE_MINUS_SRC_ALPHA,
    DST_ALPHA,
    SRC_COLOR,
    ONE_MINUS_SRC_COLOR,
    ONE_MINUS_DST_ALPHA;

    @Nullable
    public static DstBlendMode findByName( @Nonnull final String name )
    {
      return Arrays.stream( DstBlendMode.values() )
        .filter( value -> value.name().equals( name ) )
        .findFirst()
        .orElse( null );
    }
  }

  @Nullable
  private SrcBlendMode _srcBlend;
  @Nullable
  private DstBlendMode _dstBlend;

  public boolean isDefault() { return null == _srcBlend || null == _dstBlend; }

  @Nullable
  public SrcBlendMode getSrcBlend()
  {
    return _srcBlend;
  }

  public void setSrcBlend( @Nullable final SrcBlendMode srcBlend ) { _srcBlend = srcBlend; }

  @Nullable
  public DstBlendMode getDstBlend()
  {
    return _dstBlend;
  }

  public void setDstBlend( @Nullable final DstBlendMode dstBlend ) { _dstBlend = dstBlend; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    if ( !isDefault() ) {
      if ( SrcBlendMode.ONE == _srcBlend && DstBlendMode.ONE == _dstBlend ) {
        output.writeDirective( "blendFunc", "add" );
      } else if ( SrcBlendMode.SRC_ALPHA == _srcBlend && DstBlendMode.ONE_MINUS_SRC_ALPHA == _dstBlend ) {
        output.writeDirective( "blendFunc", "blend" );
      } else if ( SrcBlendMode.DST_COLOR == _srcBlend && DstBlendMode.ZERO == _dstBlend ) {
        output.writeDirective( "blendFunc", "filter" );
      } else {
        output.writeDirective( "blendFunc", "GL_" + _srcBlend.name(), "GL_" + _dstBlend.name() );
      }
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "blendFunc", _srcBlend, _dstBlend );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      final BlendFuncStageDirective other = (BlendFuncStageDirective)o;
      return Objects.equals( _srcBlend, other._srcBlend ) && Objects.equals( _dstBlend, other._dstBlend );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
