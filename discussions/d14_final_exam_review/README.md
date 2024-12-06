# Discussion 14 - Friday, December 6

## Reminders
- Project 7 is due on **Monday, December 9th @11:59 PM**
- Your **Final Exam** is on **Thursday, December 12th @6:30 - 8:30 PM**
- Refer to the following for more information:
    - [**Final Exam Logistics**](https://piazza.com/class/lzthtu8sxwsmm/post/1510)
    - [**Final Exam Makeups**](https://piazza.com/class/lzthtu8sxwsmm/post/1478)
- Don't forget to do **course evals**! ඞ

## Final Exam Exercises! :D

#### 1. Regular Expressions: 

##### Summer 2023 Exam 1:
![image](https://hackmd.io/_uploads/Hy63E4C7Jl.png)

<details>
  <summary><b>Solution</b></summary>
    <image src=https://hackmd.io/_uploads/Sy_deIk4Jx.png)>
    </image>
</details>

*Note, the answer key forgets to escape the parentheses ^*

##### Write me a regular expression that only accepts integers between in the range $[0, 314]$ inclusive, without padding zeroes in front.

<details>
  <summary><b>Solution</b></summary>
    
    (0|[1-9][0-9]|[12][0-9]{2}|30[0-9]|31[0-4])
</details>

#### 2. Finite State Machines

##### Spring 2024 Final Exam:
![image](https://hackmd.io/_uploads/ryC3zIJNyg.png)

<details>
  <summary><b>Solution</b></summary>
    <image src="https://hackmd.io/_uploads/SkbuXL1Nke.png"></image>
</details>

##### Write me a regular expression and a CFG that represents the DFA above.

<details>
  <summary><b>Solution</b></summary>
    
    RegEx: [ab]+
    CFG: S → aT|bT
         T → aT|bT|ϵ

</details>

#### 3. OCaml Typing and Evaluation

##### For the following expressions, give the type of the variable 'r'. If there is a type error, put "ERROR".
```{ocaml}
1. let r = fun a b c d -> (a b)@(c::d)
2. let r x y = fun z -> fold_left y [1] (map x z)
```
<details>
  <summary><b>Solution</b></summary>
    
    1. ('a -> 'b list) -> 'a -> 'b -> 'b list -> 'b list
    2. ('a -> 'b) -> (int list -> 'b -> int list) -> 'a list -> int list

</details>

##### Now evaluate the following expressions. If there is a compilation error, put "ERROR"
```{ocaml}
1. let r = fun a b c d -> (a b)@(c::d) in r (fun x -> [x]) 3 1 [4]
2. let r x y = fun z -> fold_left y [4] (map x z) in r (( * ) (-1)) (fun a x -> x::a) [-1; -3]
```

<details>
  <summary><b>Solution</b></summary>
    
    1. [3; 1; 4]
    2. [3; 1; 4]

</details>

#### 4. Property Based Testing
##### From Spring 2024 Final Exam
##### Consider the type definition and function of interest:
```{ocaml}
type tree = Node of tree * int * tree | Leaf of int

let rec mirror tree = match tree with
|Leaf(x) -> Leaf(x)
|Node(l,v,r) -> Node(mirror r, v, mirror l)
```
##### Consider the following properties and determine True/False:
##### (1) The property is valid for the `mirror` function 
##### (2) The property is properly implemented/encoded
##### (3) Assuming correct implementation, the property may catch bugs in `mirror` (if applicable)

```{ocaml}
Property 1: Mirroring the tree should not result in the initial tree.
Implementation: 
let test_prop tree = mirror tree <> tree

Property 2: Mirroring a tree should not change the number of nodes.
Implementation: 
let test_prop tree = 
  let rec count tree = match tree with
  |Leaf(x) -> 1
  |Node(l,v,r) -> count l + v
in count (mirror tree) = count tree
```

<details>
  <summary><b>Solution</b></summary>

    Property 1: False, True, N/A
    Property 2: True, False, True

</details>

#### 5. Interpreters

##### From Spring 2024 Final Exam
![image](https://hackmd.io/_uploads/rJOIOPk4kx.png)
##### Consider the above CFG and OpSem. Assume OCaml's typing system. Determine whether they would fail in the Lexer, Parser, Evaluator, or are Valid expressions.
```
1) 3 10 ?
2) true false not
3) + 1 / 3 4
4) * 1 2 * 7 + 6
5) 3 true <
6) 3 14 +
```
<details>
  <summary><b>Solution</b></summary>

    1) Fails Lexer
    2) Fails Lexer
    3) Fails Parser
    4) Fails Parser
    5) Fails Evaluator
    6) Valid

</details>

#### 6. OpSem/Typechecking
##### From Fall 2024 Discussion 8

##### Using the rules given below, show: `A; let x = 3 in let x = x + 6 in x => 9`


$\Huge \frac{}{A;\ n \implies n} \quad \frac{A(x)\ =\ v}{A;\ x \implies v} \quad \frac{A;\ e_1 \implies v_1 \quad A,\ x\ :\ v_1;\ e_2 \implies v_2}{A;\ \textbf{let}\ x = e_1\ \textbf{in}\ e_2 \implies v_2} \quad \frac{A;\ e_1 \implies n_1 \quad A;\ e_2 \implies n_2 \quad n_3\ is\ n_1+n_2}{A;\ e_1+e_2 \implies n_3}$

##### Using the rules given below, show `let x = 3 in let x = x + 6 in x` is well typed:

$\Huge \frac{}{G\ \vdash\ \text{x}\ :\ G(\text{x})} \quad \frac{}{G\ \vdash\ \text{true}\ :\ \text{bool}} \quad \frac{}{G\ \vdash\ \text{false}\ :\ \text{bool}} \quad \frac{}{G\ \vdash\ \text{n}\ :\ \text{int}} \quad$

$\Huge \frac{G\ \vdash\ e1\ :\ \text{t1} \quad G,\ x\ :\ \text{t1}\ \vdash\ e2\ :\ \text{t2}}{G\ \vdash\ \text{let}\ x\ =\ e1\ \text{in}\ e2\ :\ t2} \quad
\frac{G\ \vdash\ e1\ :\ \text{int} \quad G\ \vdash\ e2\ :\ \text{int} \quad +\ =\ (\text{int},\ \text{int},\ \text{int})}{G\ \vdash\ e1\ + \ e2\ :\ \text{int}} \quad$

<details>
  <summary><b>Solution</b></summary>
    <image src="https://hackmd.io/_uploads/Sk2Szq1V1g.png"></image>
</details>

#### 7. Lambda Calculus

##### From Spring 2023 Final Exam

##### Reduce the following lambda expression. Show every step:
`((λx . (λy . y x)) y) (λx . x b)`

<details>
  <summary><b>Solution</b></summary>
    
    ((λx . (λy . y x)) y) (λx . x b)
    (λa . a y) (λx . x b) - Note, alpha conversion is necessary here
    (λx . x b) y
    y b
</details>

##### Determine the free variables in the following lambda expressions:
`(λx . (λx . x x) x) x (λy . y f ) a`
`(λx . (λx . a x) x) a (λy . y y ) x`


<details>
  <summary><b>Solution</b></summary>
    
    (λx .(λx . x x) x) x (λy . y f ) a
                       ^         ^   ^
    (λx .(λx . a x) x) a (λy . y y ) x
               ^       ^             ^
</details>

##### Which of the following expressions are alpha equivalent to the following lambda expression:
`(λx . (λx . x x) x) x (λy . y f) a`

```
a) (λx . (λb . b b) b) x (λw . w f)  a
b) (λw . (λb . b b) w) w (λc . c f) a
c) (λy . (λd . d d) y) x (a f)
d) (λw . (λz . z z) w) x (λy . y f) a
e) (λx . (λx . x x) x) x (λx . x f) a
```
<details>
  <summary><b>Solution</b></summary>
    
    d) and e) are the only alpha equivalent expressions
</details>

#### 8. Rust Ownership

##### From Spring 2024 Final Exam
##### Determine if the following code snippets will compile. If they don't, explain why.

##### 1:
```{rust}
1 fn main(){
2   let x = 4;
3   let y = x;
4   println!("{x},{y}");
5 }
```
##### 2.
```{rust}
1 fn main(){
2   let x = String::from("Hello");
3   let y = &mut x;
4   println!("{y}");
5 }
```
##### 3.
```{rust}
1 fn main(){
2   let mut x = String::from("Hello");
3   let y = &mut x;
4   x.push_str(" world");
5   println!("{x},{y}");
6 }
```
##### 4.
```{rust}
1 fn main(){
2   let mut x = String::from("Hello");
3   let y = &mut x;
4   y.push_str(" world");
5   println!("{x},{y}");
6 }
```
##### 5.
```{rust}
1 fn main(){
2   let mut x = String::from("Hello");
3   let y = &mut x;
4   y.push_str(" world");
5   println!("{y}");
6   println!("{x}");
7 }
```
##### 6.
```{rust}
1 fn function<’a>(s1:&’a String, s2:&’a String, f:bool)->usize{
2   if f {s1.len()} else{s2.len()}
3 }
4 fn main(){
5   let a = String::from("hello");
6   let b = a.clone();
7   let c = function(a,b,true);
8   println!("{a} has length {c}");
9 }
```
##### 7.
```{rust}
1 fn function<’a>(s1:&’a String, s2:&’a String, f:bool)->usize{
2   if f {s1.len()} else{s2.len()}
3 }
4 fn main(){
5   let a = String::from("hello");
6   let b = a.clone();
7   let c = function(&b,&a,true);
8   println!("{a} has length {c}");
9 }
```

##### 8. 
```{rust}
struct Pokemon{
  name:String, hp:usize
}
fn main(){
  let mut x = Pokemon{name:String::from("Pikachu"), hp: 30};
  let z = x.hp;
  println!("{}, {z}", x.name)
}
```

##### 9. 
```{rust}
struct Pokemon{
  name:String, hp:usize
}
fn main(){
  let mut x = Pokemon{name:String::from("Pikachu"), hp: 30};
  let z = x.name;
  println!("{}, {z}", x.name)
}
```

<details>
  <summary><b>Solution</b></summary>
    
    1. Compiles
    2. FAILS to compile - Cannot borrow mut from immutable balue
    3. FAILS to compile - Two mut borrows exist and used at the same time
    4. FAILS to compile - Two mut borrows exist and used at the same time
    5. Compiles - lifetime of y ends before x is used
    6. FAILS to compile - Arguments are not references
    7. Compiles
    8. Compiles
    9. FAILS to compile - Two mut borrows to the name, need to use .clone()
</details>

#### 9. OCaml/Rust Coding

*I would strongly urge you to try these problems on your own!*
##### OCaml: Given an int list list matrix, return the sum of the diagonal elements of the matrix. Assume the matrix we give you is a square matrix $(m \times m)$. Do not use any other List module functions other than map, fold_left, or fold_right.
```{ocaml}
ex.
[[1; 2; 3];
 [4; 5; 6]; => 15
 [7; 8; 9]]

let rec sum_diag matrix = ...
```

<details>
  <summary><b>Solution</b></summary>

    Solution 1:
    let rec sum_diag matrix = 
      let _, sum = 
        let helper_1 (row_index, sum) row = 
          let _, element =
            let helper_2 (col_index, value) elt = 
              if row_index = col_index then (col_index+1, elt) else (col_index+1, value) in 
            fold_left helper_2 (0, -1) row in
          (row_index + 1, element + sum) in
        fold_left helper_1 (0, 0) matrix in
      sum

    Solution 2:
    let rec helper lst target curr = match lst with 
      |[] -> failwith "element not found"
      |x::xs -> if curr = target then x else (helper xs target (curr + 1));;
        
    (* our accumulator is a tuple with the sum as the first value, and the index as the second value *)
    (* we use a helper function that gets us the value in the list at the index 'target' *)
    (* small note, fst gets you the first value in a tuple and snd gets you the second value *) 
    let rec sum_diag matrix = fst (List.fold_left (fun acc x -> let value = (helper x (snd acc) 0)
                              in (fst acc + value, snd acc + 1)) (0,0) matrix)
</details>

##### Rust: Given a Vec<Vec<u32>> matrix, return the sum of the diagonal elements of the matrix. Assume the matrix we give you is a square matrix $(m \times m)$.
```{rust}
ex.
[[1; 2; 3];
 [4; 5; 6]; => 15
 [7; 8; 9]]

fn sum_diag(matrix: Vec<Vec<u32>>) -> u32 { ...
```

<details>
  <summary><b>Solution</b></summary>
    
    fn sum_diag(matrix: Vec<Vec<u32>>) -> u32 {
      let mut sum = 0;
      for i in 0..matrix.len() {
        sum += matrix[i][i];
      }
      sum
    }
</details>


#### 10. What's your TA's name, section, and bio on the staff page? ;)

#### Good luck, and have a spectacular break!!
*TA's, this is your opportunity to say something cheesy like how much u appreciate everyone :)*
    
## Resources

- [**All Lecture Quiz Solutions**](https://piazza.com/class/lzthtu8sxwsmm/post/77)
- [**Course Resources (Including Past Final Exams)**](https://bakalian.cs.umd.edu/330/resources)
