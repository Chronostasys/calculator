%{
	#define YYSTYPE double
	#include "calculator.tab.h"
%}


%%

"+" 	{ return ADD; }
"-" 	{ return SUB; }
"*" 	{ return MUL; }
"/" 	{ return DIV; }
"|" 	{ return ABS; }
[0-9]+ 	{ yylval = (double)atoi(yytext); return NUMBER; } 
\n 		{ return EOL; }
[ \t]	{ /**whitespace**/ }
"("		{ return LP; }
")"		{ return RP; }
[0-9]+\.[0-9]+	{ sscanf(yytext, "%lf", &yylval); return DOUBLE; }
.		{ printf("Mystery character %c\n", *yytext); }

%%