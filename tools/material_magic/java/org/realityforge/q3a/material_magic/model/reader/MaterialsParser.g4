parser grammar MaterialsParser;

options { tokenVocab=MaterialsLexer; }

unit : materials EOF;

materials
	: documentation material materials
	| /* empty */
;

documentation
	: COMMENT*
	| /* empty */
	;

material
    : LABEL OPEN_BRACE directives CLOSE_BRACE
    ;

directives
    : directive directives
    | /* empty */
    ;

directive
    : generalDirective
    | q3mapDirective
    | surfaceParameterDirective
    | qerDirective
    ;

//General Directives
generalDirective
    : cullDirective
    | noPicMipDirective
    | noMipMapsDirective
    | portalDirective
    | entityMergableDirective
    | fogParmsDirective
    | skyParmsDirective
    | polygonOffsetDirective
    | sortDirective
    | deformVertexesDirective
    ;

cullDirective : CULL (CULL_DISABLE|CULL_NONE|CULL_TWOSIDED|CULL_BACK|CULL_BACKSIDE|CULL_BACKSIDED);
noPicMipDirective : NOPICMIP;
noMipMapsDirective : NOMIPMAPS;
portalDirective : PORTAL;
entityMergableDirective : ENTITYMERGABLE;
fogParmsDirective : FOGPARMS OPEN_BRACKET? number number number CLOSE_BRACKET? number number? number?;
skyParmsDirective : SKYPARMS (DASH|LABEL) (DASH|INTEGER) (DASH|LABEL);
polygonOffsetDirective : POLYGONOFFSET;
sortDirective : SORT (LABEL|number);

waveForm : generator=(SIN|SQUARE|TRIANGLE|SAWTOOTH|INVERSESAWTOOTH|NOISE) base=number amplitude=number phase=number frequency=number;

waveDeformStageDirective : WAVE spread=number waveForm;
normalDeformStageDirective : NORMAL frequency=number amplitude=number;
moveDeformStageDirective : MOVE x=number y=number z=number waveForm;
bulgeDeformStageDirective : BULGE bulgeWidth=number bulgeHeight=number bulgeSpeed=number;

projectionShadowDeformStageDirective : PROJECTIONSHADOW;
autoSpriteDeformStageDirective : AUTOSPRITE;
autoSprite2DeformStageDirective : AUTOSPRITE2;
textDeformStageDirective : (TEXT0|TEXT1|TEXT2|TEXT3|TEXT4|TEXT5|TEXT6|TEXT7);

deformStageDirective : waveDeformStageDirective
                     | normalDeformStageDirective
                     | moveDeformStageDirective
                     | bulgeDeformStageDirective
                     | projectionShadowDeformStageDirective
                     | autoSpriteDeformStageDirective
                     | autoSprite2DeformStageDirective
                     | textDeformStageDirective
                     ;

deformVertexesDirective : DEFORMVERTEXES deformStageDirective;

surfaceParameterDirective : SURFACE_PARM LABEL;

// TODO: STAGE directives
// map ($whiteimage|$lightmap|image..)
// clampmap (image..)
// animMap <frequency> <image1> .... <imageN>
// videoMap
// alphafunc <func>
// depthFunc <func>
// detail
// blendfunc <srcFactor> <dstFactor>
// or blendfunc <add|filter|blend>
// rgbGen ....
// alphaGen ....
// (texgen|tcGen) ....
// tcMod <type> <...>
// depthwrite

q3mapDirective
    : q3mapSurfaceLightDirective
    | q3mapGlobalTextureDirective
    | q3mapLightImageDirective
    | q3mapNoVertexShadowsDirective
    | q3mapForceSunlightDirective
    | q3mapFlareDirective
    | q3mapLightSubdivideDirective
    | q3mapTessSizeDirective
    | q3mapBackSplashDirective
    | q3mapLightDirective
    | q3mapSunDirective
    ;

number : (INTEGER|DECIMAL);

q3mapSurfaceLightDirective : Q3MAP_SURFACELIGHT INTEGER;
q3mapGlobalTextureDirective : Q3MAP_GLOBALTEXTURE;
q3mapSunDirective : Q3MAP_SUN number number number INTEGER INTEGER INTEGER;
q3mapLightImageDirective : Q3MAP_LIGHTIMAGE LABEL;
q3mapNoVertexShadowsDirective : Q3MAP_NOVERTEXSHADOWS;
q3mapForceSunlightDirective : Q3MAP_FORCESUNLIGHT;
q3mapFlareDirective : Q3MAP_FLARE LABEL;
q3mapLightSubdivideDirective : Q3MAP_LIGHTSUBDIVIDE INTEGER;
q3mapTessSizeDirective : TESSSIZE INTEGER;
q3mapBackSplashDirective : Q3MAP_BACKSPLASH INTEGER INTEGER;
q3mapLightDirective : LIGHT number;

qerDirective
    : qerEditorImageDirective
    | qerNoCarveDirective
    | qerTransDirective
    ;

qerEditorImageDirective : QER_EDITORIMAGE LABEL;
qerNoCarveDirective : QER_NOCARVE;
qerTransDirective : QER_TRANS DECIMAL;
