// Generated from
// /Users/peter/Code/GameDev/Quake-III-Arena/tools/material_magic/java/org/realityforge/q3a/material_magic/model/reader/MaterialsParser.g4
// by ANTLR 4.10.1
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced by {@link
 * MaterialsParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for operations with no return
 *     type.
 */
public interface MaterialsParserVisitor<T> extends ParseTreeVisitor<T>
{
  /**
   * Visit a parse tree produced by {@link MaterialsParser#unit}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitUnit( MaterialsParser.UnitContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#materials}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitMaterials( MaterialsParser.MaterialsContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#documentation}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitDocumentation( MaterialsParser.DocumentationContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#material}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitMaterial( MaterialsParser.MaterialContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#directives}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitDirectives( MaterialsParser.DirectivesContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#directive}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitDirective( MaterialsParser.DirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#generalDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitGeneralDirective( MaterialsParser.GeneralDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#cullDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitCullDirective( MaterialsParser.CullDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#noPicMipDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitNoPicMipDirective( MaterialsParser.NoPicMipDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#noMipMapsDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitNoMipMapsDirective( MaterialsParser.NoMipMapsDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#portalDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitPortalDirective( MaterialsParser.PortalDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#entityMergableDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitEntityMergableDirective( MaterialsParser.EntityMergableDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#fogParmsDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitFogParmsDirective( MaterialsParser.FogParmsDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#skyParmsDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitSkyParmsDirective( MaterialsParser.SkyParmsDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#polygonOffsetDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitPolygonOffsetDirective( MaterialsParser.PolygonOffsetDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#sortDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitSortDirective( MaterialsParser.SortDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#waveFunc}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitWaveFunc( MaterialsParser.WaveFuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#normalFunc}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitNormalFunc( MaterialsParser.NormalFuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#moveFunc}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitMoveFunc( MaterialsParser.MoveFuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#bulgeFunc}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitBulgeFunc( MaterialsParser.BulgeFuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#projectionShadowFunc}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitProjectionShadowFunc( MaterialsParser.ProjectionShadowFuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#autoSpriteFunc}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitAutoSpriteFunc( MaterialsParser.AutoSpriteFuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#autoSprite2Func}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitAutoSprite2Func( MaterialsParser.AutoSprite2FuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#textFunc}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitTextFunc( MaterialsParser.TextFuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#func}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitFunc( MaterialsParser.FuncContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#deformVertexesDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitDeformVertexesDirective( MaterialsParser.DeformVertexesDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#surfaceParameterDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitSurfaceParameterDirective( MaterialsParser.SurfaceParameterDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapDirective( MaterialsParser.Q3mapDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#number}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitNumber( MaterialsParser.NumberContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapSurfaceLightDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapSurfaceLightDirective( MaterialsParser.Q3mapSurfaceLightDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapGlobalTextureDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapGlobalTextureDirective( MaterialsParser.Q3mapGlobalTextureDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapSunDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapSunDirective( MaterialsParser.Q3mapSunDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapLightImageDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapLightImageDirective( MaterialsParser.Q3mapLightImageDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapNoVertexShadowsDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapNoVertexShadowsDirective( MaterialsParser.Q3mapNoVertexShadowsDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapForceSunlightDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapForceSunlightDirective( MaterialsParser.Q3mapForceSunlightDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapFlareDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapFlareDirective( MaterialsParser.Q3mapFlareDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapLightSubdivideDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapLightSubdivideDirective( MaterialsParser.Q3mapLightSubdivideDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapTessSizeDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapTessSizeDirective( MaterialsParser.Q3mapTessSizeDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapBackSplashDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapBackSplashDirective( MaterialsParser.Q3mapBackSplashDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#q3mapLightDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQ3mapLightDirective( MaterialsParser.Q3mapLightDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#qerDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQerDirective( MaterialsParser.QerDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#qerEditorImageDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQerEditorImageDirective( MaterialsParser.QerEditorImageDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#qerNoCarveDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQerNoCarveDirective( MaterialsParser.QerNoCarveDirectiveContext ctx );
  /**
   * Visit a parse tree produced by {@link MaterialsParser#qerTransDirective}.
   *
   * @param ctx the parse tree
   * @return the visitor result
   */
  T visitQerTransDirective( MaterialsParser.QerTransDirectiveContext ctx );
}
