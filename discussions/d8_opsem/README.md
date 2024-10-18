# Discussion 8 - Friday, October 18th

## Reminders

1. Quiz 3 is **next Friday, October 25th** in your discussion section
   1. Refer to [@740](https://piazza.com/class/lzthtu8sxwsmm/post/740) for details
1. Project 4 due **October 29th, 2024, 11:59PM**

## Exercises

### Operational Semantics

#### Problem 1:

Using the rules below, show: $\large 1 + (2 + 3) \implies 6$

$\Huge \frac{}{n \implies n} \quad \frac{e_1 \implies n_1 \quad e_2 \implies n_2 \quad n_3\ is\ n_1+n_2}{e_1+e_2 \implies n_3}$

#### Problem 2:

Using the rules given below, show: $\large A;\textbf{let}\ y = 1\ \textbf{in}\ \textbf{let}\ x = 2\ \textbf{in}\ x \implies 2$

$\Huge \frac{}{A;\ n \implies n} \quad \frac{A(x)\ =\ v}{A;\ x \implies v} \quad \frac{A;\ e_1 \implies v_1 \quad A,\ x\ :\ v_1;\ e_2 \implies v_2}{A;\ \textbf{let}\ x = e_1\ \textbf{in}\ e_2 \implies v_2} \quad \frac{A;\ e_1 \implies n_1 \quad A;\ e_2 \implies n_2 \quad n_3\ is\ n_1+n_2}{A;\ e_1+e_2 \implies n_3}$

#### Problem 3:

Using the rules given below, show: $\large A;\textbf{let}\ x = 3\ \textbf{in}\ \textbf{let}\ x = x + 6 \ \textbf{in}\ x \implies 9$

$\Huge \frac{}{A;\ n \implies n} \quad \frac{A(x)\ =\ v}{A;\ x \implies v} \quad \frac{A;\ e_1 \implies v_1 \quad A,\ x\ :\ v_1;\ e_2 \implies v_2}{A;\ \textbf{let}\ x = e_1\ \textbf{in}\ e_2 \implies v_2} \quad \frac{A;\ e_1 \implies n_1 \quad A;\ e_2 \implies n_2 \quad n_3\ is\ n_1+n_2}{A;\ e_1+e_2 \implies n_3}$

#### Problem 4:

*Note, this problem takes a long time, I would recommend skipping in discussion and doing it later in your own time~!*

Using the rules given below, show: $\large A;\textbf{let}\ x = 2\ \textbf{in}\ \textbf{let}\ y = 3\ \textbf{in}\ \textbf{let}\ x = x + 2 \ \textbf{in}\ x + y \implies 7$

$\Huge \frac{}{A;\ n \implies n} \quad \frac{A(x)\ =\ v}{A;\ x \implies v} \quad \frac{A;\ e_1 \implies v_1 \quad A,\ x\ :\ v_1;\ e_2 \implies v_2}{A;\ \textbf{let}\ x = e_1\ \textbf{in}\ e_2 \implies v_2} \quad \frac{A;\ e_1 \implies n_1 \quad A;\ e_2 \implies n_2 \quad n_3\ is\ n_1+n_2}{A;\ e_1+e_2 \implies n_3}$


### Type Checking

$\Huge \frac{}{G\ \vdash\ \text{x}\ :\ G(\text{x})} \quad \frac{}{G\ \vdash\ \text{true}\ :\ \text{bool}} \quad \frac{}{G\ \vdash\ \text{false}\ :\ \text{bool}} \quad \frac{}{G\ \vdash\ \text{n}\ :\ \text{int}} \quad$

$\Huge \frac{G\ \vdash\ e1\ :\ \text{t1} \quad G,\ x\ :\ \text{t1}\ \vdash\ e2\ :\ \text{t2}}{G\ \vdash\ \text{let}\ x\ =\ e1\ \text{in}\ e2\ :\ t2} \quad
\frac{G\ \vdash\ e1\ :\ \text{bool} \quad G\ \vdash\ e2\ :\ \text{bool}}{G\ \vdash\ e1\ \text{and}\ e2\ :\ \text{bool}} \quad$

$\Huge \frac{G\ \vdash\ e\ :\ \text{int}}{G\ \vdash\ \text{eq0}\ e\ :\ \text{bool}} \quad
\frac{G\ \vdash\ e1\ :\ \text{bool} \quad G\ \vdash\ e2\ :\ \text{t}\quad G\ \vdash\ e3\ :\ \text{t}}{G\ \vdash\ \text{if}\ e1\ \text{then}\ e2\ \text{else}\ e3\ :\ \text{t}} \quad$

Using the rules given above, show that the following statements are **well typed**:
1. `eq0 if true then 0 else 1`
2. `let x = 5 in eq0 x and false`

## Additional Readings & Resources

- [Professor Mamat's Operational Semantics Slides](https://bakalian.cs.umd.edu/assets/slides/17-semantics.pdf)
- [Professor Mamat's Type Checking Slides](https://bakalian.cs.umd.edu/assets/slides/19-Typechecking.pdf)
- [Fall 2022 - Discussion 10 (Operational Semantics)](https://github.com/umd-cmsc330/fall2022/tree/main/discussions/discussion10#operational-semantics)
- [OpSem Problem Generator](https://bakalian.cs.umd.edu/330/practice/opsem)
- [Type Checker Problem Generator](https://bakalian.cs.umd.edu/330/practice/typechecker)
