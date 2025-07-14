%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_NUM INT_TYPE LP RP IF LCB RCB GT ASSIGN ADD SEMI ID
%start stmts

%%

stmts : stmts stmt | ;
stmt : ass_stmt | if_stmt;

ass_stmt: ID ASSIGN EXP SEMI;

EXP : EXP ADD term | term;
term : INT_NUM | ID;

if_stmt: IF LP ID GT ID RP LCB stmts RCB;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}

