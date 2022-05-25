lexer grammar MaterialsLexer;

OPEN_BRACE : '{';
CLOSE_BRACE : '}';

Q3MAP_LIGHTIMAGE : 'q3map_lightimage' ;
Q3MAP_GLOBALTEXTURE : 'q3map_globaltexture' ;
Q3MAP_SURFACELIGHT : 'q3map_surfacelight' ;
Q3MAP_NOVERTEXSHADOWS : 'q3map_novertexshadows' ;
Q3MAP_FORCESUNLIGHT : 'q3map_forcesunlight' ;

QER_EDITORIMAGE : 'qer_editorimage';
QER_NOCARVE : 'qer_nocarve';
QER_TRANS : 'qer_trans';

POSITIVE_INTEGER
	: ([1-9][0-9]*)
;

INTEGER
	: '-'?([1-9][0-9]*)
;

POSITIVE_DECIMAL
	: ([0-9]+'.'[0-9]*|[0-9]*'.'[0-9]+)
;

DECIMAL
	: '-'?([0-9]+'.'[0-9]*|[0-9]*'.'[0-9]+)
;

LABEL
	: [A-Za-z0-9_\-./]+
;

WHITESPACE
	: [\t\n\r ]+ -> channel(HIDDEN)
;

COMMENT
	: ('//'~[\n\r]*)+
;
