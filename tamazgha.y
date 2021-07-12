%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	#include <string.h>
	#include "lex.yy.c"
	int i=0;

	int errors=0;

	%}

%token  WHILE_LOOP 
%token COND STMNT
%token BEGEXP FINEXP BEGINBLOCK FINBLOCK



%start prog
%%
prog :whileloop
	|
	 ;
whileloop:
		 |WHILE_LOOP  cond stmnt{ while($2){
		 	$3;
		 }}
		 ;

cond : "i" "<" "10" ";" {$$= $1<$3;};
stmnt: "write" '(' 'i' ')' ';' {printf("%d",$3);} ;
	| 'i' '+' '+' ';' {$$= $1++;} stmnt
	;
%%

int yyerror (char *s){errors++;printf("Erreur :syntaxe erreur: %s | ligne %d\n",line);}
int yywrap(){return 1;}
main(int argc,char *argv[])
{
if((yyin=fopen("test.txt","a+"))==NULL)
{
 printf("test.txt not found !\n");
 getch();
 return;
}
yyparse();
if(errors) printf("Error Recorded\n");
else printf("Script OK");
getch();
return;
}