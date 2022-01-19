/* simplest version of calculator */ 
%{
#include <stdio.h>
#define YYSTYPE double
%}


/* declare tokens */ 
%token NUMBER DOUBLE // 自然数和小数
%token ADD SUB MUL DIV ABS 
%token LP RP  // 左括号和右括号
%token EOL

%left ADD SUB
%left MUL DIV


%%

calclist:
		| calclist exp EOL { printf("= %lf\n", $2); } 


exp: interger
	| double
	| exp ADD exp { $$ = $1 + $3; } 
	| exp SUB exp { $$ = $1 - $3; }
	| exp MUL exp { $$ = $1 * $3; } 
	| exp DIV exp { $$ = $1 / $3; } 
	| LP exp RP   { $$ = $2; }
	| ABS exp ABS { $$ = $2 >= 0? $2 : - $2; } ;

double: DOUBLE
	| ADD DOUBLE { $$ = $2; }
	| SUB DOUBLE { $$ = 0 - $2; };

interger: NUMBER
	| ADD NUMBER { $$ = $2; }
	| SUB NUMBER { $$ = 0 - $2; };

%%

int main(int argc, char **argv)
{
	yyparse();
	return 0;
}

yyerror(char *s)
{
	fprintf(stderr, "error: %s\n", s);
}




