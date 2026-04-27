%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);
%}

%token NUM IDENT STRING
%token ASSIGN PRINT CONCAT LENGTH
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN COMMA
%token EOL ERROR

%left PLUS MINUS
%left TIMES DIV

%start program

%%

program
: stmt_list
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr EOL
| PRINT LPAREN expr_list RPAREN EOL
| expr EOL
| EOL 
;

expr
: expr PLUS expr
| expr MINUS expr
| expr TIMES expr
| expr DIV expr
| LPAREN expr RPAREN
| CONCAT LPAREN expr_list RPAREN
| LENGTH LPAREN expr RPAREN
| NUM
| STRING
| IDENT
;

expr_list
: expr
| expr_list COMMA expr
;

%%