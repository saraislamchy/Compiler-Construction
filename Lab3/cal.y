%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_TYPE INT_NUM FLOAT_TYPE FLOAT_NUM ASSIGN ADD SEMI ID
%start stmts

%%

stmts : stmts stmt | ;
stmt : dclr_stmt | ass_stmt;

dclr_stmt : TYPE ID SEMI
          | TYPE ID ASSIGN NUM SEMI

NUM : INT_NUM | FLOAT_NUM;
TYPE : INT_TYPE | FLOAT_TYPE;

ass_stmt : ID ASSIGN NUM SEMI;
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

