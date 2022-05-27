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
    : LABEL OPEN_BRACE materialProperties CLOSE_BRACE
    ;

// TODO: Rename "Properties" to "Directives" to match documentation
materialProperties
    : materialProperty materialProperties
    | /* empty */
    ;

materialProperty
    : generalProperty
    | q3mapMaterialProperty
    | surfaceParameterMaterialProperty
    | qerMaterialProperty
    ;

//General Directives
generalProperty
    : cullMaterialProperty
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

cullMaterialProperty : CULL (CULL_DISABLE|CULL_NONE|CULL_TWOSIDED|CULL_BACK|CULL_BACKSIDE|CULL_BACKSIDED);

surfaceParameterMaterialProperty : SURFACE_PARM LABEL;



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

q3mapMaterialProperty
    : Q3MAP_SURFACELIGHT POSITIVE_INTEGER
    | Q3MAP_GLOBALTEXTURE
    | Q3MAP_LIGHTIMAGE LABEL
    | Q3MAP_NOVERTEXSHADOWS
    | Q3MAP_FORCESUNLIGHT
    | Q3MAP_FLARE LABEL
    | Q3MAP_LIGHTSUBDIVIDE POSITIVE_INTEGER
    | TESSSIZE POSITIVE_INTEGER
    | Q3MAP_BACKSPLASH POSITIVE_INTEGER POSITIVE_INTEGER
    | LIGHT ONE_INTEGER
// NOTE: "q3map_sun" is used at runtime ... unlike all the other q3map properties
// q3map_sun <red(float)> <green(float)> <blue(float)> <intensity(float)> <degrees(float)> <elevation(float)>
    ;

qerMaterialProperty
    : QER_EDITORIMAGE LABEL
    | QER_NOCARVE
    | QER_TRANS POSITIVE_DECIMAL
    ;
