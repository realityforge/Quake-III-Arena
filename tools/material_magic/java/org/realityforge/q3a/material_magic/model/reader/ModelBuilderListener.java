package org.realityforge.q3a.material_magic.model.reader;

import javax.annotation.Nonnull;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.realityforge.q3a.material_magic.model.CullType;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.MaterialsUnit;
import org.realityforge.q3a.material_magic.model.SunDirective;
import org.realityforge.q3a.material_magic.model.SurfaceParameter;

final class ModelBuilderListener
  extends MaterialsParserBaseListener
{
  @Nonnull
  private final MaterialsUnit _unit = new MaterialsUnit();
  private Material _material;

  @Nonnull
  MaterialsUnit getUnit()
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
  public void exitQ3mapNoVertexShadowsDirective( @Nonnull final MaterialsParser.Q3mapNoVertexShadowsDirectiveContext ctx )
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
    if ( null != ctx.CULL_BACK() || null != ctx.CULL_BACKSIDE() || null != ctx.CULL_BACKSIDED() )
    {
      _material.setCull( CullType.BACK );
    }
    else if ( null != ctx.CULL_DISABLE() || null != ctx.CULL_NONE() || null != ctx.CULL_TWOSIDED() )
    {
      _material.setCull( CullType.DISABLE );
    }
    else
    {
      throw new IllegalStateException( "Unhandled cull value " + ctx.getText() );
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
    final String text = ctx.LABEL().getText().toLowerCase();
    SurfaceParameter parameter = null;
    for ( final SurfaceParameter value : SurfaceParameter.values() )
    {
      if ( value.name().equals( text ) )
      {
        parameter = value;
        break;
      }
    }
    if ( null == parameter )
    {
      throw new IllegalStateException( "Unhandled surfaceParm value " + text );
    }
    _material.getSurfaceParameters().add( parameter );
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
    _material.qer().setTransparency( Float.parseFloat( ctx.DECIMAL().getText() ) );
  }

  @Override
  public void exitMaterial( @Nonnull final MaterialsParser.MaterialContext ctx )
  {
    _material.setName( ctx.LABEL().getText() );
    _unit.addMaterial( _material );
    _material = null;
  }
}
