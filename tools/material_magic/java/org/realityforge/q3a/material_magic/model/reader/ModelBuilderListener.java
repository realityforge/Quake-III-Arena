package org.realityforge.q3a.material_magic.model.reader;

import javax.annotation.Nonnull;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.realityforge.q3a.material_magic.model.AnimMapStageDirective;
import org.realityforge.q3a.material_magic.model.AutoSprite2DeformStageDirective;
import org.realityforge.q3a.material_magic.model.AutoSpriteDeformStageDirective;
import org.realityforge.q3a.material_magic.model.BulgeDeformStageDirective;
import org.realityforge.q3a.material_magic.model.CullType;
import org.realityforge.q3a.material_magic.model.DetailStageDirective;
import org.realityforge.q3a.material_magic.model.FogDirective;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.MoveDeformStageDirective;
import org.realityforge.q3a.material_magic.model.NormalDeformStageDirective;
import org.realityforge.q3a.material_magic.model.ProjectionShadowDeformStageDirective;
import org.realityforge.q3a.material_magic.model.SkyDirective;
import org.realityforge.q3a.material_magic.model.SortDirective;
import org.realityforge.q3a.material_magic.model.SortKey;
import org.realityforge.q3a.material_magic.model.Stage;
import org.realityforge.q3a.material_magic.model.SunDirective;
import org.realityforge.q3a.material_magic.model.SurfaceParameter;
import org.realityforge.q3a.material_magic.model.TextDeformStageDirective;
import org.realityforge.q3a.material_magic.model.Unit;
import org.realityforge.q3a.material_magic.model.WaveDeformStageDirective;
import org.realityforge.q3a.material_magic.model.WaveForm;

final class ModelBuilderListener extends MaterialsParserBaseListener
{
  @Nonnull
  private final Unit _unit = new Unit();
  private Material _material;
  private Stage _stage;

  @Nonnull
  Unit getUnit()
  {
    return _unit;
  }

  @Override
  public void enterMaterial( @Nonnull final MaterialsParser.MaterialContext ctx )
  {
    _material = new Material( "" );
  }

  @Override
  public void exitQ3mapSurfaceLightDirective( @Nonnull final MaterialsParser.Q3mapSurfaceLightDirectiveContext ctx )
  {
    _material.q3map().setSurfaceLight( Integer.parseInt( ctx.INTEGER().getText() ) );
  }

  @Override
  public void exitQ3mapGlobalTextureDirective( @Nonnull final MaterialsParser.Q3mapGlobalTextureDirectiveContext ctx )
  {
    _material.q3map().setGlobalTexture( true );
  }

  @Override
  public void exitQ3mapLightImageDirective( @Nonnull final MaterialsParser.Q3mapLightImageDirectiveContext ctx )
  {
    _material.q3map().setLightImage( ctx.LABEL().getText() );
  }

  @Override
  public void exitQ3mapNoVertexShadowsDirective(
    @Nonnull final MaterialsParser.Q3mapNoVertexShadowsDirectiveContext ctx )
  {
    _material.q3map().setNoVertexShadows( true );
  }

  @Override
  public void exitQ3mapForceSunlightDirective( @Nonnull final MaterialsParser.Q3mapForceSunlightDirectiveContext ctx )
  {
    _material.q3map().setForceSunLight( true );
  }

  @Override
  public void exitQ3mapFlareDirective( @Nonnull final MaterialsParser.Q3mapFlareDirectiveContext ctx )
  {
    _material.q3map().setFlare( ctx.LABEL().getText() );
  }

  @Override
  public void exitQ3mapLightSubdivideDirective( @Nonnull final MaterialsParser.Q3mapLightSubdivideDirectiveContext ctx )
  {
    _material.q3map().setLightSubDivide( Integer.parseInt( ctx.INTEGER().getText() ) );
  }

  @Override
  public void exitQ3mapTessSizeDirective( @Nonnull final MaterialsParser.Q3mapTessSizeDirectiveContext ctx )
  {
    _material.q3map().setTessSize( Integer.parseInt( ctx.INTEGER().getText() ) );
  }

  @Override
  public void exitQ3mapBackSplashDirective( @Nonnull final MaterialsParser.Q3mapBackSplashDirectiveContext ctx )
  {
    _material.q3map().setBackSplashPercent( Integer.parseInt( ctx.INTEGER().get( 0 ).getText() ) );
    _material.q3map().setBackSplashDistance( Integer.parseInt( ctx.INTEGER().get( 1 ).getText() ) );
  }

  @Override
  public void exitQ3mapLightDirective( @Nonnull final MaterialsParser.Q3mapLightDirectiveContext ctx )
  {
    _material.q3map().setFlare( "flareshader" );
  }

  @Override
  public void exitCullDirective( @Nonnull final MaterialsParser.CullDirectiveContext ctx )
  {
    if ( null != ctx.CULL_BACK() || null != ctx.CULL_BACKSIDE() || null != ctx.CULL_BACKSIDED() ) {
      _material.setCull( CullType.BACK );
    } else if ( null != ctx.CULL_DISABLE() || null != ctx.CULL_NONE() || null != ctx.CULL_TWOSIDED() ) {
      _material.setCull( CullType.DISABLE );
    } else {
      throw new IllegalStateException( "Unhandled cull value " + ctx.getText() );
    }
  }

  @Override
  public void exitNoPicMipDirective( @Nonnull final MaterialsParser.NoPicMipDirectiveContext ctx )
  {
    _material.setNoPicMip( true );
  }

  @Override
  public void exitNoMipMapsDirective( @Nonnull final MaterialsParser.NoMipMapsDirectiveContext ctx )
  {
    _material.setNoMipMaps( true );
  }

  @Override
  public void exitPortalDirective( @Nonnull final MaterialsParser.PortalDirectiveContext ctx )
  {
    _material.setPortal( true );
  }

  @Override
  public void exitEntityMergableDirective( @Nonnull final MaterialsParser.EntityMergableDirectiveContext ctx )
  {
    _material.setEntityMergable( true );
  }

  @Override
  public void exitFogParmsDirective( @Nonnull final MaterialsParser.FogParmsDirectiveContext ctx )
  {
    final FogDirective fog = _material.fog();
    fog.setRed( Float.parseFloat( ctx.number( 0 ).getText() ) );
    fog.setGreen( Float.parseFloat( ctx.number( 1 ).getText() ) );
    fog.setBlue( Float.parseFloat( ctx.number( 2 ).getText() ) );
    fog.setDepthForOpaque( Integer.parseInt( ctx.number( 3 ).getText() ) );
  }

  @Override
  public void exitSkyParmsDirective( @Nonnull final MaterialsParser.SkyParmsDirectiveContext ctx )
  {
    final SkyDirective sky = _material.sky();
    if ( null != ctx.farBox ) {
      sky.setFarBox( ctx.farBox.getText() );
    }
    if ( null != ctx.cloudHeight ) {
      sky.setCloudHeight( Integer.parseInt( ctx.cloudHeight.getText() ) );
    }
    if ( null != ctx.nearBox ) {
      sky.setNearBox( ctx.nearBox.getText() );
    }
  }

  @Override
  public void exitPolygonOffsetDirective( @Nonnull final MaterialsParser.PolygonOffsetDirectiveContext ctx )
  {
    _material.setPolygonOffset( true );
  }

  @Override
  public void exitSortDirective( @Nonnull final MaterialsParser.SortDirectiveContext ctx )
  {
    final SortDirective sort = _material.sort();
    final TerminalNode label = ctx.LABEL();
    if ( null != label ) {
      final String text = label.getText().toLowerCase();
      final SortKey key = SortKey.findByName( text );
      if ( null == key ) {
        throw new IllegalStateException( "Unhandled sort value " + text );
      }
      sort.setKey( key );
    } else // if ( null != ctx.number() )
    {
      sort.setValue( parseNumber( ctx.number() ) );
    }
  }

  @Override
  public void exitQ3mapSunDirective( @Nonnull final MaterialsParser.Q3mapSunDirectiveContext ctx )
  {
    final SunDirective sun = new SunDirective();
    sun.setRed( parseNumber( ctx.number( 0 ) ) );
    sun.setGreen( parseNumber( ctx.number( 1 ) ) );
    sun.setBlue( parseNumber( ctx.number( 2 ) ) );
    sun.setIntensity( Integer.parseInt( ctx.INTEGER( 0 ).getText() ) );
    sun.setDegrees( Integer.parseInt( ctx.INTEGER( 1 ).getText() ) );
    sun.setElevation( Integer.parseInt( ctx.INTEGER( 2 ).getText() ) );
    _material.q3map().setSun( sun );
  }

  private float parseNumber( @Nonnull final MaterialsParser.NumberContext number )
  {
    final TerminalNode decimal = number.DECIMAL();
    return null != decimal ? Float.parseFloat( decimal.getText() ) : Integer.parseInt( number.INTEGER().getText() );
  }

  @Override
  public void exitSurfaceParameterDirective( @Nonnull final MaterialsParser.SurfaceParameterDirectiveContext ctx )
  {
    final String text = ctx.paramName.getText().toLowerCase();
    final SurfaceParameter parameter = SurfaceParameter.findByName( text );
    if ( null == parameter ) {
      throw new IllegalStateException( "Unhandled surfaceParm value " + text );
    }
    _material.addSurfaceParameter( parameter );
  }

  @Override
  public void exitQerEditorImageDirective( @Nonnull final MaterialsParser.QerEditorImageDirectiveContext ctx )
  {
    _material.qer().setEditorImage( ctx.LABEL().getText() );
  }

  @Override
  public void exitQerNoCarveDirective( @Nonnull final MaterialsParser.QerNoCarveDirectiveContext ctx )
  {
    _material.qer().setNoCarve( true );
  }

  @Override
  public void exitQerTransDirective( @Nonnull final MaterialsParser.QerTransDirectiveContext ctx )
  {
    _material.qer().setTransparency( parseNumber( ctx.number() ) );
  }

  @Override
  public void exitWaveDeformStageDirective( @Nonnull final MaterialsParser.WaveDeformStageDirectiveContext ctx )
  {
    final WaveDeformStageDirective directive = new WaveDeformStageDirective();
    directive.setSpread( parseNumber( ctx.spread ) );
    extractWaveForm( ctx.waveForm(), directive.getWave() );
    _material.addDeformStage( directive );
  }

  @Override
  public void exitNormalDeformStageDirective( @Nonnull final MaterialsParser.NormalDeformStageDirectiveContext ctx )
  {
    final NormalDeformStageDirective directive = new NormalDeformStageDirective();
    directive.setAmplitude( parseNumber( ctx.amplitude ) );
    directive.setFrequency( parseNumber( ctx.frequency ) );
    _material.addDeformStage( directive );
  }

  @Override
  public void exitMoveDeformStageDirective( @Nonnull final MaterialsParser.MoveDeformStageDirectiveContext ctx )
  {
    final MoveDeformStageDirective directive = new MoveDeformStageDirective();
    directive.setX( parseNumber( ctx.x ) );
    directive.setY( parseNumber( ctx.y ) );
    directive.setZ( parseNumber( ctx.z ) );
    extractWaveForm( ctx.waveForm(), directive.getWave() );
    _material.addDeformStage( directive );
  }

  private void extractWaveForm( @Nonnull final MaterialsParser.WaveFormContext ctx, @Nonnull final WaveForm wave )
  {
    wave.setAmplitude( parseNumber( ctx.amplitude ) );
    wave.setFrequency( parseNumber( ctx.frequency ) );
    wave.setBase( parseNumber( ctx.base ) );
    wave.setPhase( parseNumber( ctx.phase ) );
    final String generatorText = ctx.generator.getText().toUpperCase();
    final WaveForm.Generator generator = WaveForm.Generator.findByName( generatorText );
    if ( null == generator ) {
      throw new IllegalStateException( "Unhandled wave form generator: " + generatorText );
    }
    wave.setGenerator( generator );
  }

  @Override
  public void exitBulgeDeformStageDirective( @Nonnull final MaterialsParser.BulgeDeformStageDirectiveContext ctx )
  {
    final BulgeDeformStageDirective directive = new BulgeDeformStageDirective();
    directive.setWidth( parseNumber( ctx.bulgeWidth ) );
    directive.setHeight( parseNumber( ctx.bulgeHeight ) );
    directive.setSpeed( parseNumber( ctx.bulgeSpeed ) );
    _material.addDeformStage( directive );
  }

  @Override
  public void exitProjectionShadowDeformStageDirective(
    @Nonnull final MaterialsParser.ProjectionShadowDeformStageDirectiveContext ctx )
  {
    _material.addDeformStage( new ProjectionShadowDeformStageDirective() );
  }

  @Override
  public void exitAutoSpriteDeformStageDirective(
    @Nonnull final MaterialsParser.AutoSpriteDeformStageDirectiveContext ctx )
  {
    _material.addDeformStage( new AutoSpriteDeformStageDirective() );
  }

  @Override
  public void exitAutoSprite2DeformStageDirective(
    @Nonnull final MaterialsParser.AutoSprite2DeformStageDirectiveContext ctx )
  {
    _material.addDeformStage( new AutoSprite2DeformStageDirective() );
  }

  @Override
  public void exitTextDeformStageDirective( @Nonnull final MaterialsParser.TextDeformStageDirectiveContext ctx )
  {
    final TextDeformStageDirective directive = new TextDeformStageDirective();
    if ( null != ctx.TEXT0() ) {
      directive.setLevel( 0 );
    } else if ( null != ctx.TEXT1() ) {
      directive.setLevel( 1 );
    } else if ( null != ctx.TEXT2() ) {
      directive.setLevel( 2 );
    } else if ( null != ctx.TEXT3() ) {
      directive.setLevel( 3 );
    } else if ( null != ctx.TEXT4() ) {
      directive.setLevel( 4 );
    } else if ( null != ctx.TEXT5() ) {
      directive.setLevel( 5 );
    } else if ( null != ctx.TEXT6() ) {
      directive.setLevel( 6 );
    } else if ( null != ctx.TEXT7() ) {
      directive.setLevel( 7 );
    }
    _material.addDeformStage( directive );
  }

  @Override
  public void enterStage( @Nonnull final MaterialsParser.StageContext ctx )
  {
    assert null == _stage;
    _stage = new Stage();
  }

  @Override
  public void exitStage( @Nonnull final MaterialsParser.StageContext ctx )
  {
    assert null != _stage;
    _material.addStage( _stage );
    _stage = null;
  }

  @Override
  public void exitClampMapStageDirective( @Nonnull final MaterialsParser.ClampMapStageDirectiveContext ctx )
  {
    _stage.clampMap().setTexture( ctx.texture.getText() );
  }

  @Override
  public void exitAnimMapStageDirective( @Nonnull final MaterialsParser.AnimMapStageDirectiveContext ctx )
  {
    final AnimMapStageDirective animMap = _stage.animMap();
    animMap.setFrequency( parseNumber( ctx.frequency ) );
    animMap.setTexture1( ctx.texture1.getText() );
    if ( null != ctx.texture2 ) {
      animMap.setTexture2( ctx.texture2.getText() );
    }
    if ( null != ctx.texture3 ) {
      animMap.setTexture3( ctx.texture3.getText() );
    }
    if ( null != ctx.texture4 ) {
      animMap.setTexture4( ctx.texture4.getText() );
    }
    if ( null != ctx.texture5 ) {
      animMap.setTexture5( ctx.texture5.getText() );
    }
    if ( null != ctx.texture6 ) {
      animMap.setTexture6( ctx.texture6.getText() );
    }
    if ( null != ctx.texture7 ) {
      animMap.setTexture7( ctx.texture7.getText() );
    }
    if ( null != ctx.texture8 ) {
      animMap.setTexture8( ctx.texture8.getText() );
    }
  }

  @Override
  public void exitMapStageDirective( @Nonnull final MaterialsParser.MapStageDirectiveContext ctx )
  {
    _stage.map().setTexture( ctx.texture.getText() );
  }

  @Override
  public void exitVideoMapStageDirective( @Nonnull final MaterialsParser.VideoMapStageDirectiveContext ctx )
  {
    _stage.videoMap().setVideo( ctx.video.getText() );
  }

  @Override
  public void exitDepthFuncStageDirective( @Nonnull final MaterialsParser.DepthFuncStageDirectiveContext ctx )
  {
    _stage.depthFunc().setEqual( null != ctx.EQUAL() );
  }

  @Override
  public void exitDetailStageDirective( final MaterialsParser.DetailStageDirectiveContext ctx )
  {
    _stage.setDetail( new DetailStageDirective() );
  }

  @Override
  public void exitMaterial( @Nonnull final MaterialsParser.MaterialContext ctx )
  {
    final String text = ctx.name.getText();
    _material.setName( null == ctx.QUOTED_LABEL() ? text : text.substring( 1, text.length() - 1 ) );
    _unit.addMaterial( _material );
    _material = null;
  }
}
