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
    ;

q3mapMaterialProperty
    : Q3MAP_SURFACELIGHT POSITIVE_INTEGER
    | Q3MAP_GLOBALTEXTURE
    | Q3MAP_LIGHTIMAGE LABEL
    | Q3MAP_NOVERTEXSHADOWS
    | Q3MAP_FORCESUNLIGHT
    ;
