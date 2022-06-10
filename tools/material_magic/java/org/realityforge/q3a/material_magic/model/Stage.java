package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class Stage
{
  @Nullable
  private MapStageDirective _map;
  @Nullable
  private ClampMapStageDirective _clampMap;
  @Nullable
  private AnimMapStageDirective _animMap;
  @Nullable
  private VideoMapStageDirective _videoMap;
  @Nullable
  private DepthFuncStageDirective _depthFunc;
  @Nullable
  private DetailStageDirective _detail;
  @Nullable
  private DepthWriteStageDirective _depthWrite;
  @Nullable
  private AlphaFuncStageDirective _alphaFunc;
  @Nullable
  private BlendFuncStageDirective _blendFunc;
  @Nullable
  private TcGenStageDirective _tcGen;

  public boolean hasMap() { return null != _map && !_map.isDefault(); }

  @Nonnull
  public MapStageDirective map()
  {
    if ( null == _map ) {
      _map = new MapStageDirective();
    }
    return _map;
  }

  public void setMap( @Nullable final MapStageDirective map ) { _map = map; }

  public boolean hasClampMap() { return null != _clampMap && !_clampMap.isDefault(); }

  @Nonnull
  public ClampMapStageDirective clampMap()
  {
    if ( null == _clampMap ) {
      _clampMap = new ClampMapStageDirective();
    }
    return _clampMap;
  }

  public void setClampMap( @Nullable final ClampMapStageDirective clampMap ) { _clampMap = clampMap; }

  public boolean hasAnimMap() { return null != _animMap && !_animMap.isDefault(); }

  @Nonnull
  public AnimMapStageDirective animMap()
  {
    if ( null == _animMap ) {
      _animMap = new AnimMapStageDirective();
    }
    return _animMap;
  }

  public void setAnimMap( @Nullable final AnimMapStageDirective animMap ) { _animMap = animMap; }

  public boolean hasVideoMap() { return null != _videoMap && !_videoMap.isDefault(); }

  @Nonnull
  public VideoMapStageDirective videoMap()
  {
    if ( null == _videoMap ) {
      _videoMap = new VideoMapStageDirective();
    }
    return _videoMap;
  }

  public void setVideoMap( @Nullable final VideoMapStageDirective videoMap ) { _videoMap = videoMap; }

  public boolean hasDepthFunc() { return null != _depthFunc && !_depthFunc.isDefault(); }

  @Nonnull
  public DepthFuncStageDirective depthFunc()
  {
    if ( null == _depthFunc ) {
      _depthFunc = new DepthFuncStageDirective();
    }
    return _depthFunc;
  }

  public void setDepthFunc( @Nullable final DepthFuncStageDirective depthFunc ) { _depthFunc = depthFunc; }

  @Nullable
  public DetailStageDirective getDetail()
  {
    return _detail;
  }

  public void setDetail( @Nullable final DetailStageDirective detail ) { _detail = detail; }

  @Nullable
  public DepthWriteStageDirective getDepthWrite()
  {
    return _depthWrite;
  }

  public void setDepthWrite( @Nullable final DepthWriteStageDirective depthWrite ) { _depthWrite = depthWrite; }

  public boolean hasAlphaFunc() { return null != _alphaFunc && !_alphaFunc.isDefault(); }
  @Nonnull
  public AlphaFuncStageDirective alphaFunc()
  {
    if ( null == _alphaFunc ) {
      _alphaFunc = new AlphaFuncStageDirective();
    }
    return _alphaFunc;
  }

  public void setAlphaFunc( @Nullable final AlphaFuncStageDirective alphaFunc ) { _alphaFunc = alphaFunc; }

  public boolean hasBlendFunc() { return null != _blendFunc && !_blendFunc.isDefault(); }
  @Nonnull
  public BlendFuncStageDirective blendFunc()
  {
    if ( null == _blendFunc ) {
      _blendFunc = new BlendFuncStageDirective();
    }
    return _blendFunc;
  }

  public void setBlendFunc( @Nullable final BlendFuncStageDirective blendFunc ) { _blendFunc = blendFunc; }

  public boolean hasTcGen() { return null != _tcGen && !_tcGen.isDefault(); }
  @Nonnull
  public TcGenStageDirective tcGen()
  {
    if ( null == _tcGen ) {
      _tcGen = new TcGenStageDirective();
    }
    return _tcGen;
  }

  public void setTcGen( @Nullable final TcGenStageDirective tcGen ) { _tcGen = tcGen; }

  /**
   * Write the material using the standard text serialization mechanisms to the specified output
   * object.
   *
   * @param output the output object to emit material to.
   * @throws IOException if there is an error writing to MaterialOutput
   */
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeStage( o -> {
      if ( hasMap() ) {
        map().write( o );
      }
      if ( hasClampMap() ) {
        clampMap().write( o );
      }
      if ( hasAnimMap() ) {
        animMap().write( o );
      }
      if ( hasVideoMap() ) {
        videoMap().write( o );
      }
      if ( hasDepthFunc() ) {
        depthFunc().write( o );
      }
      if ( null != _detail ) {
        _detail.write( o );
      }
      if ( null != _depthWrite ) {
        _depthWrite.write( o );
      }
      if ( hasAlphaFunc() ) {
        alphaFunc().write( o );
      }
      if ( hasBlendFunc() ) {
        blendFunc().write( o );
      }
      if ( hasTcGen() ) {
        tcGen().write( o );
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
      final Stage that = (Stage)o;
      return Objects.equals( hasMap() ? _map : null, that.hasMap() ? that._map : null ) &&
        Objects.equals( hasClampMap() ? _clampMap : null, that.hasClampMap() ? that._clampMap : null ) &&
        Objects.equals( hasAnimMap() ? _animMap : null, that.hasAnimMap() ? that._animMap : null ) &&
        Objects.equals( hasVideoMap() ? _videoMap : null, that.hasVideoMap() ? that._videoMap : null ) &&
        Objects.equals( hasDepthFunc() ? _depthFunc : null, that.hasDepthFunc() ? that._depthFunc : null ) &&
        Objects.equals( _detail, that._detail ) && Objects.equals( _depthWrite, that._depthWrite ) &&
        Objects.equals( hasAlphaFunc() ? _alphaFunc : null, that.hasAlphaFunc() ? that._alphaFunc : null ) &&
        Objects.equals( hasBlendFunc() ? _blendFunc : null, that.hasBlendFunc() ? that._blendFunc : null ) &&
        Objects.equals( hasTcGen() ? _tcGen : null, that.hasTcGen() ? that._tcGen : null );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( hasMap() ? _map : null,
                         hasClampMap() ? _clampMap : null,
                         hasAnimMap() ? _animMap : null,
                         hasVideoMap() ? _videoMap : null,
                         hasDepthFunc() ? _depthFunc : null,
                         _detail,
                         _depthWrite,
                         hasAlphaFunc() ? _alphaFunc : null,
                         hasBlendFunc() ? _blendFunc : null,
                         hasTcGen() ? _tcGen : null );
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
