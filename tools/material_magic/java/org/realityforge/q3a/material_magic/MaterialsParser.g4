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
    : LABEL OPEN_BRACE CLOSE_BRACE
    ;