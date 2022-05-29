lexer grammar MaterialsLexer;

// The way for supporting case insensitive directives is to use fragments to define the token
// as described in https://stackoverflow.com/questions/1844562/how-to-match-a-string-but-case-insensitively

fragment A:[aA];
fragment B:[bB];
fragment C:[cC];
fragment D:[dD];
fragment E:[eE];
fragment F:[fF];
fragment G:[gG];
fragment H:[hH];
fragment I:[iI];
fragment J:[jJ];
fragment K:[kK];
fragment L:[lL];
fragment M:[mM];
fragment N:[nN];
fragment O:[oO];
fragment P:[pP];
fragment Q:[qQ];
fragment R:[rR];
fragment S:[sS];
fragment T:[tT];
fragment U:[uU];
fragment V:[vV];
fragment W:[wW];
fragment X:[xX];
fragment Y:[yY];
fragment Z:[zZ];

OPEN_BRACE : '{';
CLOSE_BRACE : '}';

OPEN_BRACKET : '(';
CLOSE_BRACKET : ')';

DASH : '-';

CULL : 'cull';

CULL_DISABLE : D I S A B L E;
// These next two are "deprecated" synonyms of "disable"
CULL_NONE : N O N E;
CULL_TWOSIDED : T W O S I D E D;

CULL_BACK : B A C K;
// These next two are "deprecated" synonyms of "back"
CULL_BACKSIDE : B A C K S I D E;
CULL_BACKSIDED : B A C K S I D E D;

NOPICMIP : N O P I C M I P;
NOMIPMAPS : N O M I P M A P S;
PORTAL : P O R T A L;
ENTITYMERGABLE : E N T I T Y M E R G A B L E;
FOGPARMS : F O G P A R M S;
SKYPARMS : S K Y P A R M S;
POLYGONOFFSET : P O L Y G O N O F F S E T;

Q3MAP_LIGHTIMAGE : Q '3' M A P '_' L I G H T I M A G E;
Q3MAP_GLOBALTEXTURE : Q '3' M A P '_' G L O B A L T E X T U R E;
Q3MAP_SURFACELIGHT : Q '3' M A P '_' S U R F A C E L I G H T;
Q3MAP_NOVERTEXSHADOWS : Q '3' M A P '_' N O V E R T E X S H A D O W S;
Q3MAP_FORCESUNLIGHT : Q '3' M A P '_' F O R C E S U N L I G H T;
Q3MAP_LIGHTSUBDIVIDE : Q '3' M A P '_' L I G H T S U B D I V I D E;
Q3MAP_BACKSPLASH : Q '3' M A P '_' B A C K S P L A S H;
Q3MAP_SUN : Q '3' M A P '_' S U N;
TESSSIZE : T E S S S I Z E;
Q3MAP_FLARE : Q '3' M A P '_' F L A R E;
// light <value> is the old style flare specification which is equivalent to "q3map_flare flareshader"
LIGHT : L I G H T;

QER_EDITORIMAGE : Q E R '_' E D I T O R I M A G E;
QER_NOCARVE : Q E R '_' N O C A R V E;
QER_TRANS : Q E R '_' T R A N S;

SURFACE_PARM : S U R F A C E P A R M;

INTEGER : '-'?([1-9][0-9]*);

DECIMAL : '-'?([0-9]+'.'[0-9]*|[0-9]*'.'[0-9]+);

LABEL
	: [A-Za-z0-9_\-./]+
;

WHITESPACE
	: [\t\n\r ]+ -> channel(HIDDEN)
;

COMMENT
	: ('//'~[\n\r]*|'/*'~[*]+(.|'\n')*?'*/')+ -> channel(HIDDEN)
; // Note: '/''/'~[\n\r]* instead of '/''/'.* (non-greedy because of wildcard).
