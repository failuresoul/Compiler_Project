%{
#include <stdio.h>
%}

%option nounput noinput

/* SP handles one or more spaces or tabs between words */
SP   [ \t]+

%%

 /* 1. Include Directive */
"haraiarania"                                  { printf("include\n"); }

 /* 2. Input and Output */
"foroba"                                       { printf("input keyword\n"); }
"lekoreba"                                     { printf("output keyword\n"); }

 /* 3. Core Keywords */
"shuru"                                        { printf("start keyword\n"); }
"shesh"                                        { printf("end keyword\n"); }
"nombor"                                       { printf("integer type\n"); }
"gutaalanombor"                                { printf("float type\n"); }
"mat"                                          { printf("string type\n"); }
"judi"                                         { printf("if keyword\n"); }
"naile"                                        { printf("else keyword\n"); }
"kam"                                          { printf("function keyword\n"); }
"firot"                                        { printf("return keyword\n"); }
"hasa"                                         { printf("boolean true\n"); }
"misa"                                         { printf("boolean false\n"); }

 /* 4. Loops */
"jotobil"                                      { printf("while loop\n"); }
"cokkor"{SP}"maro"                             { printf("for loop\n"); }
"domlou"                                       { printf("break\n"); }
"au"{SP}"jai"                                  { printf("continue\n"); }

 /* 5. Array, Struct, Class */
"katar"                                        { printf("array keyword\n"); }
"dhach"                                        { printf("struct\n"); }
"sreni"                                        { printf("class\n"); }

 /* 6. Native Sylheti Punctuation */
"hesh"                                         { printf("semicolon\n"); }
"bekasuru"                                     { printf("curly open\n"); }
"bekahesh"                                     { printf("curly close\n"); }
"gullasuru"                                    { printf("parenthesis open\n"); }
"gullahesh"                                    { printf("parenthesis close\n"); }
"sujasuru"                                     { printf("bracket open\n"); }
"sujahesh"                                     { printf("bracket close\n"); }
"halka"{SP}"ubau"                              { printf("comma\n"); }
"pura"{SP}"domlou"                             { printf("dot\n"); }

 /* 7. Descriptive Operators */
"jura_lagau"|"jura"{SP}"lagau"                 { printf("operator addition\n"); }
"kati"{SP}"lau"                                { printf("operator subtraction\n"); }
"furon"{SP}"koro"                              { printf("operator multiplication\n"); }
"bangi"{SP}"lau"                               { printf("operator division\n"); }
"baki"{SP}"kotokan"                            { printf("operator modulus\n"); }

"barau"                                        { printf("operator increment\n"); }
"komau"                                        { printf("operator decrement\n"); }

"shoman"                                       { printf("operator equal\n"); }
"besoman"                                      { printf("operator not equal\n"); }
"soman"{SP}"ba"{SP}"tura"{SP}"boro"            { printf("operator greater equal\n"); }
"soman"{SP}"ba"{SP}"tura"{SP}"choto"           { printf("operator less equal\n"); }
"fura"{SP}"boro"                               { printf("operator greater\n"); }
"fura"{SP}"chuto"                              { printf("operator less\n"); }

"harau"|"rakho"                                { printf("operator assign\n"); }
"jura"{SP}"lagau"{SP}"doure"                   { printf("operator add assign\n"); }
"kati"{SP}"lau"{SP}"doure"                     { printf("operator sub assign\n"); }

"duiogu"{SP}"oite"{SP}"oibo"                   { printf("operator and\n"); }
"egu"{SP}"oilei"{SP}"oibo"                     { printf("operator or\n"); }
"ja"{SP}"koibay"{SP}"ulta"                     { printf("operator not\n"); }

 /* Literals */
[0-9]+[.][0-9]+                                { printf("float literal: %s\n", yytext); }
[0-9]+                                         { printf("integer literal: %s\n", yytext); }
\"([^\"\\\n]|\\.)*\"                           { printf("string literal: %s\n", yytext); }

 /* Comments */
"bekar".*                                      { printf("single comment\n"); }
"fura"(.|\n)*"bekama"                          { printf("multi comment\n"); }

 /* Identifiers */
[a-zA-Z_][a-zA-Z0-9_]*                         { printf("identifier: %s\n", yytext); }

 /* Whitespace and ignore */
[ \t\r\n]+                                     ;
.                                              { printf("unrecognized symbol: %s\n", yytext); }

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

    if (yyin) {
        fclose(yyin);
    }

    return 0;
}
