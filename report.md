# SylhetScript Lexical Analyzer Report

**Course:** Compiler Design Laboratory  
**Project:** Custom Lexical Analyzer using Flex  
**Language Name:** **SylhetScript** (`.syl`)  

---

## 1. Title and Objective

### 1.1 Title
**Design and Implementation of a Pure Sylheti Lexical Analyzer with Custom Comments and Multi-Space Tolerance**

### 1.2 Objective
The objective of this project is to build an intuitive, clean lexical analyzer using **Flex (C)** for **SylhetScript**.

The language uses authentic Sylheti phrases for all keywords, comments, punctuation, and operators. Furthermore, the lexer handles multi-word keywords (e.g., `cokkor maro`, `jura lagau`, `soman ba tura boro`) with **multi-space tolerance**, allowing single or multiple spaces/tabs between words without breaking tokenization:
- **Comments:**
  - **Single-Line Comment (`//`):** `bekar <comment>`
  - **Multi-Line Comment (`/* ... */`):** `fura <comment> bekama`
- **Include Directive:** `haraiarania`
- **Input / Output:** `foroba` (read input), `lekoreba` (print output)
- **Data Types:** `nombor` (int), `gutaalanombor` (float), `mat` (string)
- **Control Flow:** `judi` (if), `naile` (else), `shuru` (start), `shesh` (end), `firot` (return)
- **Booleans:** `hasa` (true), `misa` (false)
- **Loops:** `jotobil` (while), `cokkor maro` (for), `domlou` (break), `au jai` (continue)
- **Data Structures:** `katar` (array), `dhach` (struct), `sreni` (class)
- **Native Punctuation:** `hesh` (semicolon), `bekasuru` (`{`), `bekahesh` (`}`), `gullasuru` (`(`), `gullahesh` (`)`), `sujasuru` (`[`), `sujahesh` (`]`), `halka ubau` (`,`), `pura domlou` (`.`)
- **Descriptive Operators:** `jura lagau`, `kati lau`, `furon koro`, `bangi lau`, `baki kotokan`, `barau`, `komau`, `shoman`, `besoman`, `soman ba tura boro`, `soman ba tura choto`, `fura boro`, `fura chuto`, `harau`, `jura lagau doure`, `kati lau doure`, `duiogu oite oibo`, `egu oilei oibo`, `ja koibay ulta`.

---

## 2. Multi-Space Tolerance & Custom Comment Mechanism

### 2.1 Multi-Space Tolerance
In natural typing, programmers may occasionally type two spaces, three spaces, or a tab between words in multi-word keywords (e.g., `cokkor    maro`).

To handle this cleanly in Flex:
1. Define a space macro:
   ```c
   SP   [ \t]+
   ```
2. Write rules connecting the words with `{SP}`:
   ```c
   "cokkor"{SP}"maro"                   { printf("for loop\n"); }
   "jura_lagau"|"jura"{SP}"lagau"       { printf("operator addition\n"); }
   "soman"{SP}"ba"{SP}"tura"{SP}"boro"  { printf("operator greater equal\n"); }
   ```

### 2.2 Custom Sylheti Comments
SylhetScript completely replaces C-style comments (`//` and `/* */`) using clean, direct one-line rules:
1. **Single-line Comment (`bekar`):**
   ```c
   "bekar".*                            { printf("single comment\n"); }
   ```
2. **Multi-line Comment (`fura ... bekama`):**
   ```c
   "fura"(.|\n)*"bekama"                { printf("multi comment\n"); }
   ```

---

## 3. Implementation of `lexer.l`

```c
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
```

---

## 4. Demonstration Program (`sample.syl`)

```syl
fura
==========================================
SylhetScript Program: sample.syl
Pure Sylheti Syntax with Custom Vocabulary
Demonstration of multi-line comment
==========================================
bekama

bekar 1. Include Directive (haraiarania)
haraiarania "gonit.syl" hesh

bekar 2. Struct Definition (dhach / bekasuru ... bekahesh)
dhach Manush bekasuru
    mat naam hesh
    nombor boyosh hesh
bekahesh hesh

bekar 3. Class Definition (sreni / bekasuru ... bekahesh)
sreni Gari bekasuru
    mat brand hesh
    nombor speed hesh

    kam chalao gullasuru gullahesh bekasuru
        lekoreba gullasuru "Gari choltese" gullahesh hesh
    bekahesh
bekahesh hesh

bekar 4. Main Program (shuru ... shesh)
shuru bekasuru

    bekar Input and Output (foroba / lekoreba)
    nombor input_num hesh
    foroba gullasuru input_num gullahesh hesh
    lekoreba gullasuru "Apne input disoin:" gullahesh hesh
    lekoreba gullasuru input_num gullahesh hesh

    bekar Variable Declarations & Assignment (harau)
    nombor a harau 10 hesh
    nombor b harau 5 hesh
    gutaalanombor pi harau 3.14 hesh
    mat shohor harau "Sylhet" hesh
    nombor thik_ase harau hasa hesh
    nombor bhul_ase harau misa hesh

    bekar Descriptive Operators: jura lagau, kati lau, furon koro, bangi lau, baki kotokan
    nombor jog harau a jura lagau b hesh
    nombor biyog harau a kati lau b hesh
    nombor goon harau a furon koro b hesh
    nombor bhaag harau a bangi lau b hesh
    nombor vagshes harau a baki kotokan b hesh

    bekar Increment and Decrement: barau, komau
    a barau hesh
    b komau hesh

    bekar Compound Assignment: jura lagau doure, kati lau doure
    a jura lagau doure 2 hesh
    b kati lau doure 1 hesh

    bekar Conditional: judi / naile
    bekar Comparison: fura boro, fura chuto, shoman, besoman
    judi gullasuru a fura boro b gullahesh bekasuru
        lekoreba gullasuru "a boro b theke" gullahesh hesh
    bekahesh naile bekasuru
        lekoreba gullasuru "b boro" gullahesh hesh
    bekahesh

    bekar Complex Condition: soman ba tura boro, duiogu oite oibo, egu oilei oibo
    judi gullasuru gullasuru a soman ba tura boro 10 gullahesh duiogu oite oibo gullasuru b besoman 0 gullahesh gullahesh bekasuru
        lekoreba gullasuru "Condition passed" gullahesh hesh
    bekahesh

    bekar While Loop: jotobil
    nombor count harau 0 hesh
    jotobil gullasuru count fura chuto 5 gullahesh bekasuru
        lekoreba gullasuru count gullahesh hesh
        count barau hesh
    bekahesh

    bekar For Loop: cokkor maro
    cokkor maro gullasuru nombor i harau 0 hesh i fura chuto 10 hesh i barau gullahesh bekasuru
        judi gullasuru i shoman 3 gullahesh bekasuru
            au jai hesh
        bekahesh
        judi gullasuru i shoman 8 gullahesh bekasuru
            domlou hesh
        bekahesh
    bekahesh

    bekar Array (katar / sujasuru ... sujahesh)
    katar nombor numbers sujasuru 5 sujahesh hesh
    numbers sujasuru 0 sujahesh harau 100 hesh
    numbers sujasuru 1 sujahesh harau 200 hesh
    lekoreba gullasuru numbers sujasuru 0 sujahesh gullahesh hesh

    bekar Dot (pura domlou) and Comma (halka ubau)
    Manush m1 hesh
    m1 pura domlou boyosh harau 25 hesh

    bekar Return (firot)
    firot 0 hesh

bekahesh
shesh
```

---

## 5. Actual Output

### 5.1 Compilation Command
```bash
flex lexer.l
gcc -Wall lex.yy.c -o lexer
```
Compiles cleanly with **zero errors and zero warnings**.

### 5.2 Execution Command
```bash
./lexer sample.syl
```

### 5.3 Actual Terminal Output
```text
multi comment
single comment
include
string literal: "gonit.syl"
semicolon
single comment
struct
identifier: Manush
curly open
string type
identifier: naam
semicolon
integer type
identifier: boyosh
semicolon
curly close
semicolon
single comment
class
identifier: Gari
curly open
string type
identifier: brand
semicolon
integer type
identifier: speed
semicolon
function keyword
identifier: chalao
parenthesis open
parenthesis close
curly open
output keyword
parenthesis open
string literal: "Gari choltese"
parenthesis close
semicolon
curly close
curly close
semicolon
single comment
start keyword
curly open
single comment
integer type
identifier: input_num
semicolon
input keyword
parenthesis open
identifier: input_num
parenthesis close
semicolon
output keyword
parenthesis open
string literal: "Apne input disoin:"
parenthesis close
semicolon
output keyword
parenthesis open
identifier: input_num
parenthesis close
semicolon
single comment
integer type
identifier: a
operator assign
integer literal: 10
semicolon
integer type
identifier: b
operator assign
integer literal: 5
semicolon
float type
identifier: pi
operator assign
float literal: 3.14
semicolon
string type
identifier: shohor
operator assign
string literal: "Sylhet"
semicolon
integer type
identifier: thik_ase
operator assign
boolean true
semicolon
integer type
identifier: bhul_ase
operator assign
boolean false
semicolon
single comment
integer type
identifier: jog
operator assign
identifier: a
operator addition
identifier: b
semicolon
integer type
identifier: biyog
operator assign
identifier: a
operator subtraction
identifier: b
semicolon
integer type
identifier: goon
operator assign
identifier: a
operator multiplication
identifier: b
semicolon
integer type
identifier: bhaag
operator assign
identifier: a
operator division
identifier: b
semicolon
integer type
identifier: vagshes
operator assign
identifier: a
operator modulus
identifier: b
semicolon
single comment
identifier: a
operator increment
semicolon
identifier: b
operator decrement
semicolon
single comment
identifier: a
operator add assign
integer literal: 2
semicolon
identifier: b
operator sub assign
integer literal: 1
semicolon
single comment
single comment
if keyword
parenthesis open
identifier: a
operator greater
identifier: b
parenthesis close
curly open
output keyword
parenthesis open
string literal: "a boro b theke"
parenthesis close
semicolon
curly close
else keyword
curly open
output keyword
parenthesis open
string literal: "b boro"
parenthesis close
semicolon
curly close
single comment
if keyword
parenthesis open
parenthesis open
identifier: a
operator greater equal
integer literal: 10
parenthesis close
operator and
parenthesis open
identifier: b
operator not equal
integer literal: 0
parenthesis close
parenthesis close
curly open
output keyword
parenthesis open
string literal: "Condition passed"
parenthesis close
semicolon
curly close
single comment
integer type
identifier: count
operator assign
integer literal: 0
semicolon
while loop
parenthesis open
identifier: count
operator less
integer literal: 5
parenthesis close
curly open
output keyword
parenthesis open
identifier: count
parenthesis close
semicolon
identifier: count
operator increment
semicolon
curly close
single comment
for loop
parenthesis open
integer type
identifier: i
operator assign
integer literal: 0
semicolon
identifier: i
operator less
integer literal: 10
semicolon
identifier: i
operator increment
parenthesis close
curly open
if keyword
parenthesis open
identifier: i
operator equal
integer literal: 3
parenthesis close
curly open
continue
semicolon
curly close
if keyword
parenthesis open
identifier: i
operator equal
integer literal: 8
parenthesis close
curly open
break
semicolon
curly close
curly close
single comment
array keyword
integer type
identifier: numbers
bracket open
integer literal: 5
bracket close
semicolon
identifier: numbers
bracket open
integer literal: 0
bracket close
operator assign
integer literal: 100
semicolon
identifier: numbers
bracket open
integer literal: 1
bracket close
operator assign
integer literal: 200
semicolon
output keyword
parenthesis open
identifier: numbers
bracket open
integer literal: 0
bracket close
parenthesis close
semicolon
single comment
identifier: Manush
identifier: m1
semicolon
identifier: m1
dot
identifier: boyosh
operator assign
integer literal: 25
semicolon
single comment
return keyword
integer literal: 0
semicolon
curly close
end keyword
```

---

## 6. Conclusion

- **Custom Sylheti Comments:** Implemented single-line comments with `bekar.*` and multi-line comments with `"fura"(.|\n)*"bekama"` using simple, direct one-line rules.
- **Multi-Space Tolerance:** Defined `{SP}` macro `[ \t]+` ensuring seamless tokenization of multi-word phrases regardless of spacing or tabs.
- **Resource Management:** Included `fclose(yyin)` to safely close open file streams.
- **Quality Assurance:** Tested against `sample.syl` with `gcc -Wall`, resulting in zero errors, zero warnings, and clean tokenization.
