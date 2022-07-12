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
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class Material
{
  @Nonnull
  private String _name;
  @Nullable
  private Q3mapDirectives _q3map;
  @Nullable
  private QerDirectives _qer;
  @Nonnull
  private CullType _cull = CullType.FRONT;
  private boolean _noPicMip;
  private boolean _noMipMaps;
  private boolean _portal;
  private boolean _entityMergable;
  private boolean _polygonOffset;
  @Nullable
  private FogDirective _fog;
  @Nullable
  private SkyDirective _sky;
  @Nullable
  private SortDirective _sort;
  @Nonnull
  private final Set<SurfaceParameter> _surfaceParameters = new HashSet<>();
  @Nonnull
  private final List<DeformStageDirective<?>> _deformStages = new ArrayList<>();
  @Nonnull
  private final List<Stage> _stages = new ArrayList<>();

  public Material( @Nonnull final String name ) { _name = Objects.requireNonNull( name ); }

  @Nonnull
  public String getName()
  {
    return _name;
  }

  public void setName( @Nonnull final String name ) { _name = Objects.requireNonNull( name ); }

  public boolean hasQ3map() { return null != _q3map; }

  @Nonnull
  public Q3mapDirectives q3map()
  {
    if ( null == _q3map ) {
      _q3map = new Q3mapDirectives();
    }
    return _q3map;
  }

  public boolean hasQer() { return null != _qer; }

  @Nonnull
  public QerDirectives qer()
  {
    if ( null == _qer ) {
      _qer = new QerDirectives();
    }
    return _qer;
  }

  @Nonnull
  public CullType getCull()
  {
    return _cull;
  }

  public void setCull( @Nonnull final CullType cull ) { _cull = Objects.requireNonNull( cull ); }

  public boolean isNoPicMip() { return _noPicMip; }

  public void setNoPicMip( final boolean noPicMip ) { _noPicMip = noPicMip; }

  public boolean isNoMipMaps() { return _noMipMaps; }

  public void setNoMipMaps( final boolean noMipMaps ) { _noMipMaps = noMipMaps; }

  public boolean isPortal() { return _portal; }

  public void setPortal( final boolean portal ) { _portal = portal; }

  public boolean isEntityMergable() { return _entityMergable; }

  public void setEntityMergable( final boolean entityMergable ) { _entityMergable = entityMergable; }

  public boolean isPolygonOffset() { return _polygonOffset; }

  public void setPolygonOffset( final boolean polygonOffset ) { _polygonOffset = polygonOffset; }

  public boolean hasFog() { return null != _fog; }

  @Nonnull
  public FogDirective fog()
  {
    if ( null == _fog ) {
      _fog = new FogDirective();
    }
    return _fog;
  }

  public void setFog( @Nullable final FogDirective fog ) { _fog = fog; }

  public boolean hasSky() { return null != _sky; }

  @Nonnull
  public SkyDirective sky()
  {
    if ( null == _sky ) {
      _sky = new SkyDirective();
    }
    return _sky;
  }

  public void setSky( @Nullable final SkyDirective sky ) { _sky = sky; }

  public boolean hasSort() { return null != _sort; }

  @Nonnull
  public SortDirective sort()
  {
    if ( null == _sort ) {
      _sort = new SortDirective();
    }
    return _sort;
  }

  public void setSort( @Nullable final SortDirective sort ) { _sort = sort; }

  public void addDeformStage( @Nonnull final DeformStageDirective<?> deformStage ) { _deformStages.add( deformStage ); }

  @Nonnull
  public List<DeformStageDirective<?>> getDeformStages()
  {
    return _deformStages;
  }

  public void addStage( @Nonnull final Stage stage ) { _stages.add( stage ); }

  @Nonnull
  public List<Stage> getStages()
  {
    return _stages;
  }

  public void addSurfaceParameter( @Nonnull final SurfaceParameter parameter ) { _surfaceParameters.add( parameter ); }

  @Nonnull
  public List<SurfaceParameter> getSurfaceParameters()
  {
    return _surfaceParameters.stream().sorted().collect( Collectors.toUnmodifiableList() );
  }

  /**
   * Write the material using the standard text serialization mechanisms to the specified output
   * object.
   *
   * @param output the output object to emit material to.
   * @throws IOException if there is an error writing to MaterialOutput
   */
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeMaterial( getName(), o -> {
      if ( hasQ3map() ) {
        q3map().write( o );
      }
      if ( hasQer() ) {
        qer().write( o );
      }
      if ( CullType.FRONT != _cull ) {
        o.writeDirective( "cull", CullType.BACK == _cull ? "back" : "disable" );
      }
      if ( _noPicMip ) {
        o.writeDirective( "nopicmip" );
      }
      if ( _noMipMaps ) {
        o.writeDirective( "nomipmaps" );
      }
      if ( _portal ) {
        o.writeDirective( "portal" );
      }
      if ( _entityMergable ) {
        o.writeDirective( "entityMergable" );
      }
      if ( _polygonOffset ) {
        o.writeDirective( "polygonOffset" );
      }
      if ( null != _fog ) {
        _fog.write( o );
      }
      if ( null != _sky ) {
        _sky.write( o );
      }
      if ( null != _sort ) {
        _sort.write( o );
      }
      for ( final SurfaceParameter parameter : getSurfaceParameters() ) {
        parameter.write( o );
      }
      for ( final DeformStageDirective<?> stage : getDeformStages() ) {
        stage.write( o );
      }
      for ( final Stage stage : getStages() ) {
        stage.write( o );
      }
    } );
  }

  @Override
  public boolean equals( Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( o == null || getClass() != o.getClass() ) {
      return false;
    } else {
      final Material that = (Material)o;
      return _name.equals( that._name ) && _cull.equals( that._cull ) && _noPicMip == that._noPicMip &&
        _noMipMaps == that._noMipMaps && _portal == that._portal && _entityMergable == that._entityMergable &&
        _polygonOffset == that._polygonOffset && Objects.equals( _fog, that._fog ) &&
        Objects.equals( null == _sky || _sky.isDefault() ? null : _sky,
                        null == that._sky || that._sky.isDefault() ? null : that._sky ) &&
        Objects.equals( null == _sort || _sort.isDefault() ? null : _sort,
                        null == that._sort || that._sort.isDefault() ? null : that._sort ) &&
        Objects.equals( getSurfaceParameters(), that.getSurfaceParameters() ) &&
        Objects.equals( getDeformStages(), that.getDeformStages() ) &&
        Objects.equals( getStages(), that.getStages() ) && Objects.equals( q3map(), that.q3map() ) &&
        Objects.equals( qer(), that.qer() );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( _name,
                         _cull,
                         _noPicMip,
                         _noMipMaps,
                         _portal,
                         _entityMergable,
                         _polygonOffset,
                         _fog,
                         null == _sky || _sky.isDefault() ? null : _sky,
                         null == _sort || _sort.isDefault() ? null : _sort,
                         getSurfaceParameters(),
                         getDeformStages(),
                         getStages(),
                         q3map(),
                         qer() );
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
