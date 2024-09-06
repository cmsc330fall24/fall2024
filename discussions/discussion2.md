# Discussion 2 - Friday, September 6th

## Reminders

1. Quiz 1 next **Friday, September 13th**
   1. Quizzes will start **at the beginning of discussion.**
   1. Topics will be announced soon on Piazza.
3. Project 1 was released last night, due **Sunday, September 15th @ 11:59 PM**
4. Quiz makeup policy: [@7](https://piazza.com/class/lzthtu8sxwsmm/post/7)
   1. Quiz makeups will be during your assigned lecture time on the Monday (if you are in sections 03xx) and on the Tuesday (if you are in sections 01xx - 02xx) immediately following a quiz.
   1. Quiz Makeup Location: IRB 5165
   1. MUST submit documentation — see Piazza post for details


## Exercises

1. Write the following functions in OCaml **using recursion**:

   ### `remove_all lst x`

   - **Type:** `'a list -> 'a -> 'a list`
   - **Description:** Takes in a list `lst` and returns the list `lst` without any instances of the element `x` in the same order.

   ```ocaml
   remove_all [1;2;3;1] 1 = [2;3]
   remove_all [1;2;3;1] 5 = [1;2;3;1]
   remove_all [true; false; false] false = [true]
   remove_all [] 42 = []
   ```

   ```
   let rec fun remove_all lst x =
      match lst with
      |[] -> []
      |x::t -> if x = target then remove_all t else x::t ;;

   [1;2;3]   target = 1
   1st call 1::[2;3]
   2nd call 2::[3]
   3rd call 3::[]
   4th call []
   ```

   ### `index_of lst x`

   - **Type:** `'a list -> 'a -> int`
   - **Description:** Takes in a list `lst` and returns the index of the first instance of element `x`.
   - **Notes:**
     - If the element doesn't exist, you should return `-1`
     - You can write a helper function!

   ```ocaml
   index_of [1;2;3;1] 1 = 0
   index_of [4;2;3;1] 1 = 3
   index_of [true; false; false] false = 1
   index_of [] 42 = -1
   ```

1. Give the type for each of the following OCaml expressions:

   > **NOTE:** Feel free to skip around, there are a lot of examples! 🙃

   ```ocaml
   [2a] fun a b -> b < a
      'a -> 'b -> bool ??
      a/b are int OR float, but b and a have to be the same type
      - 1 < 2 OR 0.3 < 0.5
      - 'a and 'b represents all types

   [2b] fun a b -> b + a > b - a
      int -> int -> bool

   [2c] fun a b c -> (int_of_string c) * (b + a)
      int -> int -> string -> int

   [2d] fun a b c -> (if c then a else a) * (b + a)
      int -> int -> bool -> int

   [2e] fun a b c -> [ a + b; if c then a else a + b ]
      int -> int -> bool -> int

   [2f] fun a b c -> if a b != a c then (a b) else (c < 2.0)
      a b    ----> a is a function and b is a parameter to a
      so (a b != a c) is a function
      c is a float because its being compared to 2.0
      a is a function that takes in one element and outputs a boolean, this element has to be a float since c was an argument for a and c is a float
      then b is also a float
      (float -> bool) -> float -> float -> bool
   
   [2g] fun a b c d -> if a && b < c then d + 1 else b
         bool -> b' -> c' -> int
         bool -> b' -> c' -> int  (b is an int bc d has to be an int if its next to the + operator to be added to 1)
         bool -> int -> int -> int (c is an int since b is an int)
   ```
      
2. Write an OCaml expression for each of the following types:

   ```ocaml
   [3a] int * bool list
      (5, [true; false]) (two bool)

   [3b] (int * float) -> int -> float -> bool list
      let foo abc = if a = (1,2.0) && a = (b,c) then [true] else [false]
      - because of the "let" foo can be used later
      
   [3c] float -> string -> int * bool
      if string_of_float a == b then (2, true) else (2, false)??
   
   [3d] (int -> bool) -> int -> bool list
         

   [3e] ('a -> 'b) -> 'a -> 'a * 'b list
      fun f a -> (a, [f a])
      - because there's no "let", this function has no name and cant be called later
      
   [3f] ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c

   [3g] 'a -> 'b list -> 'a -> 'a * 'a
   ```

3. Give the type of the following OCaml function:

   ```ocaml
   let rec f p x y =
   match x, y with
      | ([], []) -> []
      | ((a,b)::t1, c::t2) -> (p a c, p b c)::(f p t1 t2)
      | (_, _) -> failwith "error";;
   ```

4. What values do `x`, `y`, and `z` bind to in the following code snippet?

   ```ocaml
   let x = match ("lol", 7) with
      | ("haha", 5)  -> "one"
      | ("lol", _)   -> "two"
      | ("lol", 7)   -> "three"
   ;;
      answer: two, since 7 is included in _
      - in general, you want your match to cover all input cases
      - let tup = (5,7) in
         match tup with
         | (a,b) -> ___

   let y = match (2, true) with
      | (1, _)       -> "one"
      | (2, false)   -> "two"
      | (_, _)       -> "three"
      | (_, true)    -> "four"
   ;;
      answer: three

   let z = match [1;2;4] with
      | []           -> "one"
      | 2::_         -> "two"
      | 1::2::t      -> "three"
      | _            -> "four"
   ;;
      answer: three
      - you can match lists using cons
      - 1::2::4::t is also valid 
   ```

More information + examples can be found in the [spring23 OCaml discussion](https://github.com/cmsc330-umd/spring23/tree/main/discussions/d3_ocaml).

## Resources & Additional Readings

- Encouraged (but optional) readings
  - [Spring 2023 OCaml Discussion](https://github.com/cmsc330-umd/spring23/tree/main/discussions/d3_ocaml)
  - [cs3110 - Expressions in OCaml](https://cs3110.github.io/textbook/chapters/basics/expressions.html)
- OCaml typing / expression generators
  - https://nmittu.github.io/330-problem-generator/type_of_expr.html
  - https://nmittu.github.io/330-problem-generator/expr_of_type.html
