%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include "prova1.tab.h"
%}

%%

"//".* {}
"print"         { return PRINT; }
"concat"        { return CONCAT; }
"length"        { return LENGTH; }
[0-9]+          { return NUM; }
\"[^\"]*\"      { return STRING; }
[a-zA-Z][a-zA-Z0-9_]* { return IDENT; }
"="             { return ASSIGN; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIV; }
"("             { return LPAREN; }
")"             { return RPAREN; }
","             { return COMMA; }
\n              { return EOL; }
[ \t\r]+        {}
.               { return ERROR; }

%%