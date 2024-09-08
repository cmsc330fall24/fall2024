# Solutions

## Question \#1

```ocaml
let rec remove_all lst x = match lst with
    | [] -> []
    | h::t -> if x = h then (remove_all t x) else h::(remove_all t x);;
```

```ocaml
let index_of lst x = 
    let rec helper lst x i = match lst with
    | [] -> -1
    | h::t -> if x = h then i else (helper t x (i + 1)) 
in helper lst x 0;;
```

## Question \#2

```ocaml
[2a] 'a -> 'a -> bool

[2b] int -> int -> bool

[2c] int -> int -> string -> int

[2d] int -> int -> bool -> int

[2e] int -> int -> bool -> int list

[2f] (float -> bool) -> float -> float -> bool

[2g] bool -> int -> int -> int -> int
```

## Question \#3

```ocaml
[3a] (1, [true])
(* NOTE: same thing as `int * (bool list)` *)

[3b] fun (a, b) c d -> [a + 1 = c; b +. 1.0 = d]

[3c] fun a b -> (int_of_float a, b = "a")

[3d] fun f a -> [f a; a = 2]

[3e] fun f a -> (a, [f a])

[3f] fun f g a -> g (f a)

[3g] fun a b c -> if (a = c && b = []) then (a,a) else (c,c)
```

## Question \#4

```ocaml
('a -> 'b -> 'c) -> ('a * 'a) list -> 'b list -> ('c * 'c) list
```

## Question \#5

1. two
2. three
3. three
