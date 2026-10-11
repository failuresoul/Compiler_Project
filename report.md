# SylhetScript Lexical Analyzer Report

**Course:** Compiler Design Laboratory  
**Project:** Simple Lexical Analyzer using Flex  
**Language Name:** **SylhetScript** (`.syl`)  

---

## 1. Title and Objective

### 1.1 Title
**Design and Implementation of a Simple Lexical Analyzer for SylhetScript**

### 1.2 Objective
The objective of this laboratory task is to construct a minimal and clean lexical analyzer using **Flex (C)** following standard laboratory conventions. 

SylhetScript uses regional Sylheti words for keywords, punctuation, and operators:
- **Include Directive:** `haraiarania` (include)
- **Input / Output:** `foroba` (input), `lekoreba` (output)
- **Data Types:** `nombor` (int), `gutaalanombor` (float), `mat` (string)
- **Control Flow:** `judi` (if), `naile` (else), `shuru` (start), `shesh` (end), `firot` (return)
- **Booleans:** `hasa` (true), `misa` (false)
- **Loops:** `jotobil` (while), `cokkor maro` (for), `domlou` (break), `au jai` (continue)
- **Data Structures:** `katar` (array), `dhach` (struct), `sreni` (class)
- **Native Punctuation:** `hesh` (semicolon), `bekasuru` (`{`), `bekahesh` (`}`), `gullasuru` (`(`), `gullahesh` (`)`), `sujasuru` (`[`), `sujahesh` (`]`), `halka ubau` (`,`), `pura domlou` (`.`)
- **Descriptive Operators:** `jura lagau` (`+`), `kati lau` (`-`), `furon koro` (`*`), `bangi lau` (`/`), `baki kotokan` (`%`), `barau` (`++`), `komau` (`--`), `shoman` (`==`), `besoman` (`!=`), `soman ba tura boro` (`>=`), `soman ba tura choto` (`<=`), `fura boro` (`>`), `fura chuto` (`<`), `harau` (`=`), `jura lagau doure` (`+=`), `kati lau doure` (`-=`), `duiogu oite oibo` (`&&`), `egu oilei oibo` (`||`), `ja koibay ulta` (`!`).

---

## 2. Language Specification

### 2.1 Keyword & Syntax Mapping

| SylhetScript Word | Traditional Meaning | Action Output |
| :--- | :--- | :--- |
| `haraiarania` / `#include` | Include library | `include` |
| `foroba` | Input | `input keyword` |
| `lekoreba` | Output | `output keyword` |
| `shuru` | Start block | `start keyword` |
| `shesh` | End block | `end keyword` |
| `nombor` | Integer type | `integer type` |
| `gutaalanombor` | Float type | `float type` |
| `mat` | String type | `string type` |
| `judi` | If condition | `if keyword` |
| `naile` | Else condition | `else keyword` |
| `kam` | Function | `function keyword` |
| `firot` | Return | `return keyword` |
| `hasa` | True | `boolean true` |
| `misa` | False | `boolean false` |
| `jotobil` | While loop | `while loop` |
| `cokkor maro` | For loop | `for loop` |
| `domlou` | Break | `break` |
| `au jai` | Continue | `continue` |
| `katar` | Array | `array keyword` |
| `dhach` / `struct` | Struct | `struct` |
| `sreni` / `class` | Class | `class` |

### 2.2 Punctuation Mapping

| SylhetScript Word | Symbol | Action Output |
| :--- | :--- | :--- |
| `hesh` | `;` | `semicolon` |
| `bekasuru` | `{` | `curly open` |
| `bekahesh` | `}` | `curly close` |
| `gullasuru` | `(` | `parenthesis open` |
| `gullahesh` | `)` | `parenthesis close` |
| `sujasuru` | `[` | `bracket open` |
| `sujahesh` | `]` | `bracket close` |
| `halka ubau` | `,` | `comma` |
| `pura domlou` | `.` | `dot` |

### 2.3 Operators Mapping

| SylhetScript Word | Symbol | Action Output |
| :--- | :--- | :--- |
| `jura lagau` | `+` | `operator addition` |
| `kati lau` | `-` | `operator subtraction` |
| `furon koro` | `*` | `operator multiplication` |
| `bangi lau` | `/` | `operator division` |
| `baki kotokan` | `%` | `operator modulus` |
| `barau` | `++` | `operator increment` |
| `komau` | `--` | `operator decrement` |
| `harau` / `rakho` | `=` | `operator assign` |
| `shoman` | `==` | `operator equal` |
| `besoman` | `!=` | `operator not equal` |
| `soman ba tura boro` | `>=` | `operator greater equal` |
| `soman ba tura choto` | `<=` | `operator less equal` |
| `fura boro` | `>` | `operator greater` |
| `fura chuto` | `<` | `operator less` |
| `jura lagau doure` | `+=` | `operator add assign` |
| `kati lau doure` | `-=` | `operator sub assign` |
| `duiogu oite oibo` | `&&` | `operator and` |
| `egu oilei oibo` | `\|\|` | `operator or` |
| `ja koibay ulta` | `!` | `operator not` |

---

## 3. Implementation of `lexer.l`

The full Flex source code is clean, direct, and beginner-friendly:

```c
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
```

---

## 4. Demonstration Program (`sample.syl`)

```c
// ==========================================
// SylhetScript Program: sample.syl
// Pure Sylheti Syntax with Custom Vocabulary
// ==========================================

// 1. Include Directive (haraiarania)
haraiarania "gonit.syl" hesh

// 2. Struct Definition (dhach / bekasuru ... bekahesh)
dhach Manush bekasuru
    mat naam hesh
    nombor boyosh hesh
bekahesh hesh

// 3. Class Definition (sreni / bekasuru ... bekahesh)
sreni Gari bekasuru
    mat brand hesh
    nombor speed hesh

    kam chalao gullasuru gullahesh bekasuru
        lekoreba gullasuru "Gari choltese" gullahesh hesh
    bekahesh
bekahesh hesh

// 4. Main Program (shuru ... shesh)
shuru bekasuru

    // Input and Output (foroba / lekoreba)
    nombor input_num hesh
    foroba gullasuru input_num gullahesh hesh
    lekoreba gullasuru "Apne input disoin:" gullahesh hesh
    lekoreba gullasuru input_num gullahesh hesh

    // Variable Declarations & Assignment (harau)
    nombor a harau 10 hesh
    nombor b harau 5 hesh
    gutaalanombor pi harau 3.14 hesh
    mat shohor harau "Sylhet" hesh
    nombor thik_ase harau hasa hesh
    nombor bhul_ase harau misa hesh

    // Descriptive Operators: jura lagau, kati lau, furon koro, bangi lau, baki kotokan
    nombor jog harau a jura lagau b hesh
    nombor biyog harau a kati lau b hesh
    nombor goon harau a furon koro b hesh
    nombor bhaag harau a bangi lau b hesh
    nombor vagshes harau a baki kotokan b hesh

    // Increment and Decrement: barau, komau
    a barau hesh
    b komau hesh

    // Compound Assignment: jura lagau doure, kati lau doure
    a jura lagau doure 2 hesh
    b kati lau doure 1 hesh

    // Conditional: judi / naile
    // Comparison: fura boro, fura chuto, shoman, besoman
    judi gullasuru a fura boro b gullahesh bekasuru
        lekoreba gullasuru "a boro b theke" gullahesh hesh
    bekahesh naile bekasuru
        lekoreba gullasuru "b boro" gullahesh hesh
    bekahesh

    // Complex Condition: soman ba tura boro, duiogu oite oibo, egu oilei oibo
    judi gullasuru gullasuru a soman ba tura boro 10 gullahesh duiogu oite oibo gullasuru b besoman 0 gullahesh gullahesh bekasuru
        lekoreba gullasuru "Condition passed" gullahesh hesh
    bekahesh

    // While Loop: jotobil
    nombor count harau 0 hesh
    jotobil gullasuru count fura chuto 5 gullahesh bekasuru
        lekoreba gullasuru count gullahesh hesh
        count barau hesh
    bekahesh

    // For Loop: cokkor maro
    cokkor maro gullasuru nombor i harau 0 hesh i fura chuto 10 hesh i barau gullahesh bekasuru
        judi gullasuru i shoman 3 gullahesh bekasuru
            au jai hesh
        bekahesh
        judi gullasuru i shoman 8 gullahesh bekasuru
            domlou hesh
        bekahesh
    bekahesh

    // Array (katar / sujasuru ... sujahesh)
    katar nombor numbers sujasuru 5 sujahesh hesh
    numbers sujasuru 0 sujahesh harau 100 hesh
    numbers sujasuru 1 sujahesh harau 200 hesh
    lekoreba gullasuru numbers sujasuru 0 sujahesh gullahesh hesh

    // Dot (pura domlou) and Comma (halka ubau)
    Manush m1 hesh
    m1 pura domlou boyosh harau 25 hesh

    // Return (firot)
    firot 0 hesh

bekahesh
shesh
```

---

## 5. Compilation and Run

### 5.1 Build
```bash
flex lexer.l
gcc -Wall lex.yy.c -o lexer
```
Compiles with **zero errors and zero warnings**.

### 5.2 Execution
```bash
./lexer sample.syl
```

### 5.3 Actual Output
```text
single comment
single comment
single comment
single comment
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

The full code in `lexer.l` has been implemented in a clear, minimal style:
- Direct, simple actions printing token categories.
- Covers include directive, input/output, keywords, loops, array, struct, class, native punctuation, and descriptive operators.
- Compiles with zero warnings and runs cleanly.
