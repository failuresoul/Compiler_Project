%{
#include <stdio.h>
%}

%option nounput noinput

%%

 /* 1. Include Directive */
"haraiarania"|"#include"             { printf("include\n"); }

 /* 2. Input and Output */
"foroba"                             { printf("input keyword\n"); }
"lekoreba"                           { printf("output keyword\n"); }

 /* 3. Core Keywords */
"shuru"                              { printf("start keyword\n"); }
"shesh"                              { printf("end keyword\n"); }
"nombor"                             { printf("integer type\n"); }
"gutaalanombor"                      { printf("float type\n"); }
"mat"                                { printf("string type\n"); }
"judi"                               { printf("if keyword\n"); }
"naile"                              { printf("else keyword\n"); }
"kam"                                { printf("function keyword\n"); }
"firot"                              { printf("return keyword\n"); }
"hasa"                               { printf("boolean true\n"); }
"misa"                               { printf("boolean false\n"); }

 /* 4. Loops */
"jotobil"                            { printf("while loop\n"); }
"cokkor maro"                        { printf("for loop\n"); }
"domlou"                             { printf("break\n"); }
"au jai"                             { printf("continue\n"); }

 /* 5. Array, Struct, Class */
"katar"                              { printf("array keyword\n"); }
"dhach"|"struct"                     { printf("struct\n"); }
"sreni"|"class"                      { printf("class\n"); }

 /* 6. Native Punctuation */
"hesh"|";"                           { printf("semicolon\n"); }
"bekasuru"|"{"                       { printf("curly open\n"); }
"bekahesh"|"}"                       { printf("curly close\n"); }
"gullasuru"|"("                      { printf("parenthesis open\n"); }
"gullahesh"|")"                      { printf("parenthesis close\n"); }
"sujasuru"|"["                       { printf("bracket open\n"); }
"sujahesh"|"]"                       { printf("bracket close\n"); }
"halka ubau"|","                     { printf("comma\n"); }
"pura domlou"|"."                    { printf("dot\n"); }

 /* 7. Descriptive Operators */
"jura_lagau"|"jura lagau"|"+"        { printf("operator addition\n"); }
"kati lau"|"-"                       { printf("operator subtraction\n"); }
"furon koro"|"*"                     { printf("operator multiplication\n"); }
"bangi lau"|"/"                      { printf("operator division\n"); }
"baki kotokan"|"%"                   { printf("operator modulus\n"); }

"barau"|"++"                         { printf("operator increment\n"); }
"komau"|"--"                         { printf("operator decrement\n"); }

"shoman"|"=="                        { printf("operator equal\n"); }
"besoman"|"!="                       { printf("operator not equal\n"); }
"soman ba tura boro"|">="           { printf("operator greater equal\n"); }
"soman ba tura choto"|"<="          { printf("operator less equal\n"); }
"fura boro"|">"                      { printf("operator greater\n"); }
"fura chuto"|"<"                     { printf("operator less\n"); }

"harau"|"rakho"|"="                  { printf("operator assign\n"); }
"jura lagau doure"|"+="              { printf("operator add assign\n"); }
"kati lau doure"|"-="               { printf("operator sub assign\n"); }

"duiogu oite oibo"|"&&"              { printf("operator and\n"); }
"egu oilei oibo"|"||"                { printf("operator or\n"); }
"ja koibay ulta"|"!"                 { printf("operator not\n"); }

 /* Literals */
[0-9]+[.][0-9]+                      { printf("float literal: %s\n", yytext); }
[0-9]+                               { printf("integer literal: %s\n", yytext); }
\"[^\n\"]*\"                         { printf("string literal: %s\n", yytext); }

 /* Identifiers */
[a-zA-Z_][a-zA-Z0-9_]*               { printf("identifier: %s\n", yytext); }

 /* Comments */
"//".*                               { printf("single comment\n"); }
"/*"([^*]|\*+[^*/])*"*/"             { printf("multi comment\n"); }

 /* Whitespace and ignore */
[ \t\r\n]+                           ;
.                                    ;

%%

int yywrap()
{
    return 1;
}

int main(int argc, char **argv)
{
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
    } else {
        yyin = fopen("sample.syl", "r");
    }

    if (!yyin) {
        printf("Error: Could not open file\n");
        return 1;
    }

    yylex();
    return 0;
}
