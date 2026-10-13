%{
#include <stdio.h>
%}

%%

 /* 1. Include Directive */
"haraiarania"                                  { printf("include: %s\n", yytext); }

 /* 2. Input and Output */
"foroba"                                       { printf("input keyword: %s\n", yytext); }
"lekoreba"                                     { printf("output keyword: %s\n", yytext); }

 /* 3. Core Keywords */
"shuru"                                        { printf("start keyword: %s\n", yytext); }
"shesh"                                        { printf("end keyword: %s\n", yytext); }
"nombor"                                       { printf("integer type: %s\n", yytext); }
"boro_nombor"                                  { printf("long long int type: %s\n", yytext); }
"gutaalanombor"                                { printf("float type: %s\n", yytext); }
"boro_gutaalanombor"                           { printf("double type: %s\n", yytext); }
"mat"                                          { printf("string type: %s\n", yytext); }
"judi"                                         { printf("if keyword: %s\n", yytext); }
"naile"                                        { printf("else keyword: %s\n", yytext); }
"kam"                                          { printf("function keyword: %s\n", yytext); }
"firot"                                        { printf("return keyword: %s\n", yytext); }
"hasa"                                         { printf("boolean true: %s\n", yytext); }
"misa"                                         { printf("boolean false: %s\n", yytext); }

 /* 4. Switch Case */
"bodlao"                                       { printf("switch keyword: %s\n", yytext); }
"dhaf"                                         { printf("case keyword: %s\n", yytext); }
"shesh_mesh"                                   { printf("default keyword: %s\n", yytext); }

 /* 5. Loops */
"jotobil"                                      { printf("while loop: %s\n", yytext); }
"cokkor_maro"                                  { printf("for loop: %s\n", yytext); }
"domlou"                                       { printf("break: %s\n", yytext); }
"au_jai"                                       { printf("continue: %s\n", yytext); }

 /* 6. Array, Struct, Class */
"katar"                                        { printf("array keyword: %s\n", yytext); }
"dhach"                                        { printf("struct: %s\n", yytext); }
"sreni"                                        { printf("class: %s\n", yytext); }

 /* 7. Native Sylheti Punctuation */
"hesh"                                         { printf("semicolon : %s\n", yytext); }
"bekasuru"                                     { printf("2nd bracket start : %s\n", yytext); }
"bekahesh"                                     { printf("2nd bracket end : %s\n", yytext); }
"gullasuru"                                    { printf("1st bracket start : %s\n", yytext); }
"gullahesh"                                    { printf("1st bracket end : %s\n", yytext); }
"sujasuru"                                     { printf("3rd bracket start : %s\n", yytext); }
"sujahesh"                                     { printf("3rd bracket end : %s\n", yytext); }
"halka_ubau"                                   { printf("comma : %s\n", yytext); }
"pura_domlou"                                  { printf("dot : %s\n", yytext); }
"dui_futa"|":"                                 { printf("colon : %s\n", yytext); }

 /* 8. Descriptive Operators */
"jura_lagau"                                   { printf("operator addition: %s\n", yytext); }
"kati_lau"                                     { printf("operator subtraction: %s\n", yytext); }
"furon_koro"                                   { printf("operator multiplication: %s\n", yytext); }
"bangi_lau"                                    { printf("operator division: %s\n", yytext); }
"baki_kotokan"                                 { printf("operator modulus: %s\n", yytext); }

"barau"                                        { printf("operator increment: %s\n", yytext); }
"komau"                                        { printf("operator decrement: %s\n", yytext); }

"shoman"                                       { printf("operator equal: %s\n", yytext); }
"besoman"                                      { printf("operator not equal: %s\n", yytext); }
"soman_ba_tura_boro"                           { printf("operator greater equal: %s\n", yytext); }
"soman_ba_tura_choto"                          { printf("operator less equal: %s\n", yytext); }
"fura_boro"                                    { printf("operator greater: %s\n", yytext); }
"fura_chuto"                                   { printf("operator less: %s\n", yytext); }

"harau"|"rakho"                                { printf("operator assign: %s\n", yytext); }
"jura_lagau_doure"                             { printf("operator add assign: %s\n", yytext); }
"kati_lau_doure"                               { printf("operator sub assign: %s\n", yytext); }

"duiogu_oite_oibo"                             { printf("operator and: %s\n", yytext); }
"egu_oilei_oibo"                               { printf("operator or: %s\n", yytext); }
"ja_koibay_ulta"                               { printf("operator not: %s\n", yytext); }

 /* Literals */
[0-9]+[.][0-9]+                                { printf("float literal: %s\n", yytext); }
[0-9]+                                         { printf("integer literal: %s\n", yytext); }
\"([^\"\\\n]|\\.)*\"                           { printf("string literal: %s\n", yytext); }

 /* Comments */
"bekar".*                                      { printf("single comment: %s\n", yytext); }
"fura"(.|\n)*"bekama"                          { printf("multi comment: %s\n", yytext); }

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

int main()
{
    yyin = fopen("sample.syl", "r");
    yylex();
    return 0;
}
