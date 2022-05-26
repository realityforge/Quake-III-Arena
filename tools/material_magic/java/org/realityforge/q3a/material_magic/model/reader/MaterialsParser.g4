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

materialProperties
    : materialProperty materialProperties
    | /* empty */
    ;

materialProperty
    : q3mapMaterialProperty
    | qerMaterialProperty
    | cullMaterialProperty
    | surfaceParameterMaterialProperty
    ;

cullMaterialProperty : CULL (CULL_DISABLE|CULL_NONE|CULL_TWOSIDED|CULL_BACK|CULL_BACKSIDE|CULL_BACKSIDED);

surfaceParameterMaterialProperty : SURFACE_PARM LABEL;

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
    ;

qerMaterialProperty
    : QER_EDITORIMAGE LABEL
    | QER_NOCARVE
    | QER_TRANS POSITIVE_DECIMAL
    ;
