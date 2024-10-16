(*
Grammar for math-ew
E -> n 
  -> + n E (Plus node)
  -> - n E (Minus node)
*)

(*
If you are copying into utop, you need the following line (with # symbol):

#require "re";;

*)

type token = Int of int|Add|Sub

let tokenize s = 
  let re_num = Re.Perl.compile (Re.Perl.re "^([0-9]+)") in
  let re_add = Re.Perl.compile (Re.Perl.re "^\+") in 
  let re_sub = Re.Perl.compile (Re.Perl.re "^-") in 
  let rec mklst text = 
    if text = "" then [] else
    if (Re.execp re_num text) then
      let matched = Re.Group.get (Re.exec re_num text) 1 in 
      Int(int_of_string matched)::(mklst (String.sub text (String.length matched) ((String.length text)-(String.length matched))))
    else if (Re.execp re_add text) then
      Add::(mklst (String.sub text 1 ((String.length text)-1)))
    else if (Re.execp re_sub text) then
      Sub::(mklst (String.sub text 1 ((String.length text)-1)))
    else (mklst (String.sub text 1 ((String.length text)-1))) in
  mklst s



type ast = Num of int | Plus of ast * ast |Minus of ast * ast

let rec parse tokens = match tokens with
  [] ->  raise (Failure ("not enough tokens"))
 |Int(x)::xs -> Num(x),xs
 |Add::Int(y)::xs ->  
                    let s,l = parse xs in
                    (Plus(Num(y),s),l)
 |Sub::Int(y)::xs ->  
                    let s,l = parse xs in
                    (Minus(Num(y),s),l)
 |_  -> raise (Failure "not gram correct")

let parse_wrapper tokens = 
  let tree,leftover = parse tokens in 
  if leftover = [] then
    tree
  else
    raise (Failure ("have extra tokens"))

let rec interp ast = match ast with
   Num(x) -> x
  |Plus(e1,e2) -> let n1 = interp e1 in
                  let n2 = interp e2 in 
                  let n3 = n1 + n2 in 
                  n3
  |Minus(e1,e2) -> let n1 = interp e1 in
                   let n2 = interp e2 in 
                   let n3 = n1 - n2 in 
                   n3
