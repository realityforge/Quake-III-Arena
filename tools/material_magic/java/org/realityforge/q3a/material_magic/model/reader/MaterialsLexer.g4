/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
DEFORMVERTEXES : D E F O R M V E R T E X E S;

WAVE : W A V E;
NORMAL : N O R M A L;
MOVE : M O V E;
BULGE : B U L G E;
PROJECTIONSHADOW : P R O J E C T I O N S H A D O W;
AUTOSPRITE : A U T O S P R I T E;
AUTOSPRITE2 : A U T O S P R I T E '2';
TEXT0 : T E X T '0';
TEXT1 : T E X T '1';
TEXT2 : T E X T '2';
TEXT3 : T E X T '3';
TEXT4 : T E X T '4';
TEXT5 : T E X T '5';
TEXT6 : T E X T '6';
TEXT7 : T E X T '7';

SIN : S I N;
SQUARE : S Q U A R E;
TRIANGLE : T R I A N G L E;
SAWTOOTH : S A W T O O T H;
INVERSESAWTOOTH : I N V E R S E S A W T O O T H;
NOISE : N O I S E;

SORT : S O R T;

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

MAP : M A P;
CLAMPMAP : C L A M P M A P;
ANIMMAP : A N I M M A P;
VIDEOMAP : V I D E O M A P;
DEPTHFUNC : D E P T H F U N C;
DETAIL : D E T A I L;
BLENDFUNC : B L E N D F U N C;
RGBGEN : R G B G E N;
ALPHAGEN : A L P H A G E N;
ALPHAFUNC : A L P H A F U N C;
TCGEN : T C G E N;
TCMOD : T C M O D;
DEPTHWRITE : D E P T H W R I T E;

IDENTITY : I D E N T I T Y;
IDENTITYLIGHTING : I D E N T I T Y L I G H T I N G;
ENTITY : E N T I T Y;
ONEMINUSENTITY : O N E M I N U S E N T I T Y;
VERTEX : V E R T E X;
EXACTVERTEX : E X A C T V E R T E X;
LIGHTINGDIFFUSE : L I G H T I N G D I F F U S E;

LIGHTINGSPECULAR : L I G H T I N G S P E C U L A R;

BASE : B A S E;
LIGHTMAP : L I G H T M A P;
ENVIRONMENT : E N V I R O N M E N T;

ROTATE : R O T A T E;
SCALE : S C A L E;
SCROLL : S C R O L L;
STRETCH : S T R E T C H;
TRANSFORM : T R A N S F O R M;
TURB : T U R B;

EQUAL : E Q U A L;
LEQUAL : L E Q U A L;

GT0 : G T '0';
LT128 : L T '1' '2' '8';
GE128 : G E '1' '2' '8';

STAR_WHITE : '*' W H I T E;

INTEGER : '-'?([0-9][0-9]*);

DECIMAL : '-'?([0-9]+'.'[0-9]*|[0-9]*'.'[0-9]+);

QUOTED_LABEL
	: '"'[A-Za-z0-9_\-.$ ][ A-Za-z0-9_\-./$]*'"'
;
LABEL
	: [A-Za-z0-9_\-.$][A-Za-z0-9_\-./$]*
;

WHITESPACE
	: [\t\n\r ]+ -> channel(HIDDEN)
;

COMMENT
	: ('//'~[\n\r]*|'/*'~[*]+(.|'\n')*?'*/')+ -> channel(HIDDEN)
; // Note: '/''/'~[\n\r]* instead of '/''/'.* (non-greedy because of wildcard).
