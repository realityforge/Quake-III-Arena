parser grammar MaterialsParser;

options { tokenVocab=MaterialsLexer; }

materialsContainer
	: materials EOF
;

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
//skyParms
//deformVertexes
//entityMergable
//fogParms
//noPicMip
//noMipMaps
//polygonOffset
//portal
//sort
    ;

cullDirective : CULL (CULL_DISABLE|CULL_NONE|CULL_TWOSIDED|CULL_BACK|CULL_BACKSIDE|CULL_BACKSIDED);

surfaceParameterDirective : SURFACE_PARM LABEL;

// STAGE properties
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
