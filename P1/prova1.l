%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

{REAL} {
    lexema = yytext;
    return NUM;
}

{INT} {
    lexema = yytext;
    return NUM;
}

"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return TIMES; }
"/"     { return DIV; }
"("     { return LPAREN; }
")"     { return RPAREN; }

\n      { return EOL; }

[ \t]   { /*Ignora os espaços*/ }

. { /*Qualquer caracter que não foi mapeado*/
    return ERROR;
}

%%
