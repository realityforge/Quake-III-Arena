// Generated from
// /Users/peter/Code/GameDev/Quake-III-Arena/tools/material_magic/java/org/realityforge/q3a/material_magic/model/reader/MaterialsParser.g4
// by ANTLR 4.10.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by {@link MaterialsParser}.
 */
public interface MaterialsParserListener extends ParseTreeListener
{
  /**
   * Enter a parse tree produced by {@link MaterialsParser#unit}.
   *
   * @param ctx the parse tree
   */
  void enterUnit( MaterialsParser.UnitContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#unit}.
   *
   * @param ctx the parse tree
   */
  void exitUnit( MaterialsParser.UnitContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#materials}.
   *
   * @param ctx the parse tree
   */
  void enterMaterials( MaterialsParser.MaterialsContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#materials}.
   *
   * @param ctx the parse tree
   */
  void exitMaterials( MaterialsParser.MaterialsContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#documentation}.
   *
   * @param ctx the parse tree
   */
  void enterDocumentation( MaterialsParser.DocumentationContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#documentation}.
   *
   * @param ctx the parse tree
   */
  void exitDocumentation( MaterialsParser.DocumentationContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#material}.
   *
   * @param ctx the parse tree
   */
  void enterMaterial( MaterialsParser.MaterialContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#material}.
   *
   * @param ctx the parse tree
   */
  void exitMaterial( MaterialsParser.MaterialContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#directives}.
   *
   * @param ctx the parse tree
   */
  void enterDirectives( MaterialsParser.DirectivesContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#directives}.
   *
   * @param ctx the parse tree
   */
  void exitDirectives( MaterialsParser.DirectivesContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#directive}.
   *
   * @param ctx the parse tree
   */
  void enterDirective( MaterialsParser.DirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#directive}.
   *
   * @param ctx the parse tree
   */
  void exitDirective( MaterialsParser.DirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#generalDirective}.
   *
   * @param ctx the parse tree
   */
  void enterGeneralDirective( MaterialsParser.GeneralDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#generalDirective}.
   *
   * @param ctx the parse tree
   */
  void exitGeneralDirective( MaterialsParser.GeneralDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#cullDirective}.
   *
   * @param ctx the parse tree
   */
  void enterCullDirective( MaterialsParser.CullDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#cullDirective}.
   *
   * @param ctx the parse tree
   */
  void exitCullDirective( MaterialsParser.CullDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#noPicMipDirective}.
   *
   * @param ctx the parse tree
   */
  void enterNoPicMipDirective( MaterialsParser.NoPicMipDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#noPicMipDirective}.
   *
   * @param ctx the parse tree
   */
  void exitNoPicMipDirective( MaterialsParser.NoPicMipDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#noMipMapsDirective}.
   *
   * @param ctx the parse tree
   */
  void enterNoMipMapsDirective( MaterialsParser.NoMipMapsDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#noMipMapsDirective}.
   *
   * @param ctx the parse tree
   */
  void exitNoMipMapsDirective( MaterialsParser.NoMipMapsDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#portalDirective}.
   *
   * @param ctx the parse tree
   */
  void enterPortalDirective( MaterialsParser.PortalDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#portalDirective}.
   *
   * @param ctx the parse tree
   */
  void exitPortalDirective( MaterialsParser.PortalDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#entityMergableDirective}.
   *
   * @param ctx the parse tree
   */
  void enterEntityMergableDirective( MaterialsParser.EntityMergableDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#entityMergableDirective}.
   *
   * @param ctx the parse tree
   */
  void exitEntityMergableDirective( MaterialsParser.EntityMergableDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#fogParmsDirective}.
   *
   * @param ctx the parse tree
   */
  void enterFogParmsDirective( MaterialsParser.FogParmsDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#fogParmsDirective}.
   *
   * @param ctx the parse tree
   */
  void exitFogParmsDirective( MaterialsParser.FogParmsDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#skyParmsDirective}.
   *
   * @param ctx the parse tree
   */
  void enterSkyParmsDirective( MaterialsParser.SkyParmsDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#skyParmsDirective}.
   *
   * @param ctx the parse tree
   */
  void exitSkyParmsDirective( MaterialsParser.SkyParmsDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#polygonOffsetDirective}.
   *
   * @param ctx the parse tree
   */
  void enterPolygonOffsetDirective( MaterialsParser.PolygonOffsetDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#polygonOffsetDirective}.
   *
   * @param ctx the parse tree
   */
  void exitPolygonOffsetDirective( MaterialsParser.PolygonOffsetDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#sortDirective}.
   *
   * @param ctx the parse tree
   */
  void enterSortDirective( MaterialsParser.SortDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#sortDirective}.
   *
   * @param ctx the parse tree
   */
  void exitSortDirective( MaterialsParser.SortDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#waveFunc}.
   *
   * @param ctx the parse tree
   */
  void enterWaveFunc( MaterialsParser.WaveFuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#waveFunc}.
   *
   * @param ctx the parse tree
   */
  void exitWaveFunc( MaterialsParser.WaveFuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#normalFunc}.
   *
   * @param ctx the parse tree
   */
  void enterNormalFunc( MaterialsParser.NormalFuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#normalFunc}.
   *
   * @param ctx the parse tree
   */
  void exitNormalFunc( MaterialsParser.NormalFuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#moveFunc}.
   *
   * @param ctx the parse tree
   */
  void enterMoveFunc( MaterialsParser.MoveFuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#moveFunc}.
   *
   * @param ctx the parse tree
   */
  void exitMoveFunc( MaterialsParser.MoveFuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#bulgeFunc}.
   *
   * @param ctx the parse tree
   */
  void enterBulgeFunc( MaterialsParser.BulgeFuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#bulgeFunc}.
   *
   * @param ctx the parse tree
   */
  void exitBulgeFunc( MaterialsParser.BulgeFuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#projectionShadowFunc}.
   *
   * @param ctx the parse tree
   */
  void enterProjectionShadowFunc( MaterialsParser.ProjectionShadowFuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#projectionShadowFunc}.
   *
   * @param ctx the parse tree
   */
  void exitProjectionShadowFunc( MaterialsParser.ProjectionShadowFuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#autoSpriteFunc}.
   *
   * @param ctx the parse tree
   */
  void enterAutoSpriteFunc( MaterialsParser.AutoSpriteFuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#autoSpriteFunc}.
   *
   * @param ctx the parse tree
   */
  void exitAutoSpriteFunc( MaterialsParser.AutoSpriteFuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#autoSprite2Func}.
   *
   * @param ctx the parse tree
   */
  void enterAutoSprite2Func( MaterialsParser.AutoSprite2FuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#autoSprite2Func}.
   *
   * @param ctx the parse tree
   */
  void exitAutoSprite2Func( MaterialsParser.AutoSprite2FuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#textFunc}.
   *
   * @param ctx the parse tree
   */
  void enterTextFunc( MaterialsParser.TextFuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#textFunc}.
   *
   * @param ctx the parse tree
   */
  void exitTextFunc( MaterialsParser.TextFuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#func}.
   *
   * @param ctx the parse tree
   */
  void enterFunc( MaterialsParser.FuncContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#func}.
   *
   * @param ctx the parse tree
   */
  void exitFunc( MaterialsParser.FuncContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#deformVertexesDirective}.
   *
   * @param ctx the parse tree
   */
  void enterDeformVertexesDirective( MaterialsParser.DeformVertexesDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#deformVertexesDirective}.
   *
   * @param ctx the parse tree
   */
  void exitDeformVertexesDirective( MaterialsParser.DeformVertexesDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#surfaceParameterDirective}.
   *
   * @param ctx the parse tree
   */
  void enterSurfaceParameterDirective( MaterialsParser.SurfaceParameterDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#surfaceParameterDirective}.
   *
   * @param ctx the parse tree
   */
  void exitSurfaceParameterDirective( MaterialsParser.SurfaceParameterDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapDirective( MaterialsParser.Q3mapDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapDirective( MaterialsParser.Q3mapDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#number}.
   *
   * @param ctx the parse tree
   */
  void enterNumber( MaterialsParser.NumberContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#number}.
   *
   * @param ctx the parse tree
   */
  void exitNumber( MaterialsParser.NumberContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapSurfaceLightDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapSurfaceLightDirective( MaterialsParser.Q3mapSurfaceLightDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapSurfaceLightDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapSurfaceLightDirective( MaterialsParser.Q3mapSurfaceLightDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapGlobalTextureDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapGlobalTextureDirective( MaterialsParser.Q3mapGlobalTextureDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapGlobalTextureDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapGlobalTextureDirective( MaterialsParser.Q3mapGlobalTextureDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapSunDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapSunDirective( MaterialsParser.Q3mapSunDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapSunDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapSunDirective( MaterialsParser.Q3mapSunDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapLightImageDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapLightImageDirective( MaterialsParser.Q3mapLightImageDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapLightImageDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapLightImageDirective( MaterialsParser.Q3mapLightImageDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapNoVertexShadowsDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapNoVertexShadowsDirective( MaterialsParser.Q3mapNoVertexShadowsDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapNoVertexShadowsDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapNoVertexShadowsDirective( MaterialsParser.Q3mapNoVertexShadowsDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapForceSunlightDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapForceSunlightDirective( MaterialsParser.Q3mapForceSunlightDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapForceSunlightDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapForceSunlightDirective( MaterialsParser.Q3mapForceSunlightDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapFlareDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapFlareDirective( MaterialsParser.Q3mapFlareDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapFlareDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapFlareDirective( MaterialsParser.Q3mapFlareDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapLightSubdivideDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapLightSubdivideDirective( MaterialsParser.Q3mapLightSubdivideDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapLightSubdivideDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapLightSubdivideDirective( MaterialsParser.Q3mapLightSubdivideDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapTessSizeDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapTessSizeDirective( MaterialsParser.Q3mapTessSizeDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapTessSizeDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapTessSizeDirective( MaterialsParser.Q3mapTessSizeDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapBackSplashDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapBackSplashDirective( MaterialsParser.Q3mapBackSplashDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapBackSplashDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapBackSplashDirective( MaterialsParser.Q3mapBackSplashDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#q3mapLightDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQ3mapLightDirective( MaterialsParser.Q3mapLightDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#q3mapLightDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQ3mapLightDirective( MaterialsParser.Q3mapLightDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#qerDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQerDirective( MaterialsParser.QerDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#qerDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQerDirective( MaterialsParser.QerDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#qerEditorImageDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQerEditorImageDirective( MaterialsParser.QerEditorImageDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#qerEditorImageDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQerEditorImageDirective( MaterialsParser.QerEditorImageDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#qerNoCarveDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQerNoCarveDirective( MaterialsParser.QerNoCarveDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#qerNoCarveDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQerNoCarveDirective( MaterialsParser.QerNoCarveDirectiveContext ctx );
  /**
   * Enter a parse tree produced by {@link MaterialsParser#qerTransDirective}.
   *
   * @param ctx the parse tree
   */
  void enterQerTransDirective( MaterialsParser.QerTransDirectiveContext ctx );
  /**
   * Exit a parse tree produced by {@link MaterialsParser#qerTransDirective}.
   *
   * @param ctx the parse tree
   */
  void exitQerTransDirective( MaterialsParser.QerTransDirectiveContext ctx );
}
