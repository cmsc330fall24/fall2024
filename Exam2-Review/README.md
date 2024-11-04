# Exam 2 Review Session

### Lambda Calculus
* A minimal Turing-complete language  (basis for many functional programming languages)
* CFG: E -> x
          | Lx.E
          | E E
          | (E)
* As long as Lambda Calc statements can be derived from the above grammar, they are valid
- What we need to know: 
- #### How to beta-reduce/evalutate a Lambda calc expression
  - Need an expression of the form (Lx.E1) E2, apply E2 to the function, evaluating E1 with the binding of x to E2
- #### Lazy vs Eager evaluation
  - These are only relevant if there is 2 ways to evaluate an expression 
  - Lazy/Call by Name: input the entire parameter expression directly into the function application
  - Eager/Call by Value: evaluate the parameter expression then input to function
  - Example: 
    - (Lx. x y) ((La. a) b)
    - Lazy: 
      - (((La. a) b) y)
      - (b y)
    - Eager: 
      - (Lx. x y) b
      - (b y)
- #### scoping rules/left associativity (and explicit parenthesis)
  - Scope of a parameter goes until the first unmatched right paren or end of the line
  - left assoc: a b c -> ((a b) c)
- #### Free and Bound variables
  - If a var is in scope of it being defined, it is bound
  - Otherwise, it is free
  
- Examples!


### Operational Semantics
* Gives meaning to a language and proves correctness of a program
* Explains how an expression evaluates to a certain value
* Variables stored in the environment

- Goal of operational semantics
    - give meaning to the language
        - specifically how we are allowed to use it / how it operates
        - symbols are arbitrary: could define ? as adding numbers together, ex 4?3 -> 7
    - prove the correctness of a program
        - does the program run how we expect it to run? in other words, does it follow the rules given to us?
     
- Target language: language we're talking about - could be defined using a CFG like in project 4
- Meta language: language we're using to describe the target language - working with its types and semantics when evaluating

- Axiom: a conclusion or rule that is known to be true
    - a number always evaluates to itself, "false" is "false"
- For an expression, build a proof from the bottom up
    - each subexpression eventually should evaluate to one defined by an axiom
    - can nest rules to derive new expressions
- mappings from variables to values stored in environment, lookup to get them
- Examples!

### Type Checking
- Type Systems
    - A series of rules that ascribe types to expressions
    - A mechanism for distinguishing good programs from bad
        - good programs are well-typed
        - Examples
            - 0 + 1 -> well typed
            - false 0 -> ill-typed: can’t apply a Boolean
            - 1 + (if true then 0 else false) // ill-typed: can’t add boolean to integer
    - The same rules we used in operational semantics can be used to specify a program’s static semantics
        - `G ⊢ e : t`  → e has type t in context G
        - `G(x)` → look up x's type in G
        - `G,x:t`→ extend G so that x maps to t
- Rules
    - `G ⊢ true : bool` & `G ⊢ false : bool` & `G ⊢ n : Int`
    - `G ⊢e1: t1, G ⊢e2: t2, optype(op) = (t1,t2,t3)`
          ---
              `G ⊢ e1 op e2: t3`
    - `G ⊢ x : G(x)`
- Some theory stuff
    - "the point of a type system is to eliminate as many invalid programs while eliminating as few valid ones" -SPJ
    - Manifest typing (explicit type annotations) vs. inferred (automatic detection of types)
    - Soundness: if a program type-checks, then it is well-typed
    - Inverse not true: if a program does not type check, does not necessarily mean it is not well-typed
    - Completeness: all programs that are well-typed will pass the type-checker
    - Type safety means if a term type checks, its execution will be well-defined (never get stuck)
    - Conservatism: if a program has even the slightest possibility of a type error, it will not pass the checker
    - Static type checking for Turing-complete languages are inherently conservative and thus not complete
        - That a term is well-defined does not imply that it will type-check
            - Ex: if true then 0 else 4+"hi”
    - Dynamic type checking is often complete
            - Ex: 31 • 4+"hi" well-defined: it gives a run-time exception
            - Ex: if true then 0 else 4+"hi”
    - No type system can do all of the following (related to conservatism)
        - always terminate
        - be sound
        - be complete
- Examples!


### CFGs
* Goal of CFGs
  * We want a way to define the construction of formal languages       
  * Regular expressions are limited: no "memory" that would give it the ability to assert relations b/w elements
* Non-terminal - can be a few different things (usually written as a capital letter)
* Terminal - a specific string a non-terminal could represent
* You can convert a regex to a CFG but not the other way around
* Examples of rules supported by CFGs but not regexes:
  * Palindromes
  * Relative numbering like a^nb^(2n)
* Modeled using parse trees
  * Left hand and right hand derivations can lead to different trees
* Ambiguous grammar - 2 valid left hand or right hand derivations
* Fixing ambiguous grammars:
  * Make sure the same non-terminal doesn't appear twice like S -> S + S
  * Try adding separate non-terminals
* Production rules grow downwards by convention

### Lexing, Parsing, and Interpreters
* In-depth notes for this are available in the exam review folder or will be posted on Piazza
  * lexparsintqs.txt contains an overview of lexing, parsing, and interpreting with some sample multiple choice questions ("when will it fail?") and a walkthrough of how to build parse trees/abstract syntax trees
  * samplegrammarblank.ml contains a blank version of a lexer, parser, interpreter, and typechecker, *with step by step instructions on how to approach each one*
  * samplegrammar.ml contains a filled in version of a lexer, parser, interpreter, and typechecker, *without step by step instructions*, but *with inline comments*
  
#### Intro
* Lexing - separating an expression into a list of tokens. Does not check grammar, does not care about semantics.
  * Fails if a certain word/character is invalid
* Parsing - using this list of tokens to create an AST based on CFG rules. Checks grammar, does not care about semantics, and assumes the input is already validly lexed.
  * The parser we have been using in class is LL(1) - lookahead by 1 token
  * Type of Recursive Descent Parser
  * Only succeeds on grammatically correct expressions
* Evaluating - finding the value of an expression using the tree generated by the parser based on Opsem rules. Checks semantics, and assumes the input is already grammatically correct and lexed.
  * Fails if an expression is meaningless in a language (ex: 1 + true)
* Typechecking - finding the type of an expression using the tree generated by the parser based on Typing rules. Assumes the input is already grammatically correct and lexed.

#### Examples for multiple choice
Where does it fail?

* Classic case!
  
```
E → M and E | M or E | M
M → N + M | N − M | N
N → 1 | 2 | 3 | 4 | true | false | (E)
```

1.a: 1 + 2 - (true and false)

1.b: true + {3 - 2} 

1.c: 1 * 3

1.d: 22

<details>
  <summary>Answers</summary>
          
1.a: eval
          
1.b: lex

1.c: lex

1.d: parse

</details>

* It could have unexpected rules!

```
E → M and G | M or G | M
M → N + M | N − M | N
N → 1 | 2 | 3 | 4
G → true | false
```

2.a: true and false

2.b: true and true and false

2.c: 1 + 2

2.d: 1 + false

2.e: (true)

<details>
  <summary>Answers</summary>
          
2.a: parse
          
2.b: parse

2.c: succeeds

2.d: eval

2.e: lex

</details>

* It could have odd syntax!
```
E → + E E | ∗ E E | sq E | ex p E E | and E E | or E E | N
N → 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | true | false
```

3.a: - + 1 2 3

3.b: true and false or true

3.c: and true or false false

3.d: * 2 and true false

<details>
  <summary>Answers</summary>
          
3.a: lex
          
3.b: parse

3.c: succeeds

3.d: eval

</details>


