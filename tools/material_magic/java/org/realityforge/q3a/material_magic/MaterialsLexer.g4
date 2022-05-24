lexer grammar MaterialsLexer;

OPEN_BRACE : '{';
CLOSE_BRACE : '}';

INTEGER
	: '-'?([1-9][0-9]*)
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
