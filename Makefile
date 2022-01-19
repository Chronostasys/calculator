all:
	bison -d calculator.y -Wcounterexamples
	flex calculator.l
	gcc -o calculator calculator.tab.c lex.yy.c -ll