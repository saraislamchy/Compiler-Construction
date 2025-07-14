%option noyywrap

%{
    #include "cal.tab.h"
    #include <stdlib.h>
%}

letter [a-zA-Z]
digit [0-9]
delim [ \t]
under [_]
num {digit}{digit}*


%%

{delim}                 {}

"if"                    { return(IF); }
"("                     { return(LP); }
")"                     { return(RP); }
">"                     { return(GT); }
"{"                     { return(LCB); }
"}"                     { return(RCB); }
"+"                     { return(ADD); }
"="                     { return(ASSIGN); }
";"                     { return(SEMI); }


{num}                   { yylval = atoi(yytext); return(INT_NUM); }

({under}|{letter})({under}|{letter}|{digit})* {return(ID);}

%%
