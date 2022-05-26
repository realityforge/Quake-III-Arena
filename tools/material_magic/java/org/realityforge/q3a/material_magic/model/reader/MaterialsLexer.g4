lexer grammar MaterialsLexer;

OPEN_BRACE : '{';
CLOSE_BRACE : '}';

CULL : 'cull';

CULL_DISABLE : 'disable';
// These next two are "deprecated" synonyms of "disable"
CULL_NONE : 'none';
CULL_TWOSIDED : 'twosided';

CULL_BACK : 'back';
// These next two are "deprecated" synonyms of "back"
CULL_BACKSIDE : 'backside';
CULL_BACKSIDED : 'backsided';

Q3MAP_LIGHTIMAGE : 'q3map_lightimage';
Q3MAP_GLOBALTEXTURE : 'q3map_globaltexture';
Q3MAP_SURFACELIGHT : 'q3map_surfacelight';
Q3MAP_NOVERTEXSHADOWS : 'q3map_novertexshadows';
Q3MAP_FORCESUNLIGHT : 'q3map_forcesunlight';
Q3MAP_LIGHTSUBDIVIDE : 'q3map_lightsubdivide';
TESSSIZE : 'tesssize';
Q3MAP_FLARE : 'q3map_flare';
// light <value> is the old style flare specification which is equivalent to "q3map_flare flareshader"
LIGHT : 'light';

QER_EDITORIMAGE : 'qer_editorimage';
QER_NOCARVE : 'qer_nocarve';
QER_TRANS : 'qer_trans';

// Used by light property
ONE_INTEGER : '1';

POSITIVE_INTEGER
	: ([1-9][0-9]*)
;

INTEGER
	: '-'?([1-9][0-9]*)
;

POSITIVE_DECIMAL
	: ([0-9]+(('.'[0-9])?[0-9]*)|[0-9]*'.'[0-9]+)
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
	: ('//'~[\n\r]*|'/*'~[*]+(.|'\n')*?'*/')+ -> channel(HIDDEN)
; // Note: '/''/'~[\n\r]* instead of '/''/'.* (non-greedy because of wildcard).
