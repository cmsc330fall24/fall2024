# Discussion 13 - Rust Iterators, Closures, Smart Pointers

## Reminders
- Project 7 is due December 9th (11:59 PM)
- Final Exam is December 12th, 6:30 - 8:30 PM, rooms TBA

## Rust Iterators
[Rust Book Chapter](https://doc.rust-lang.org/book/ch13-02-iterators.html)

What is an iterator? 

- According to MIT, it is something we can call the `.next()` method on repeatedly to yield a sequence of things. 

What can that look like?

```rust
let mut range = 0..10;

loop {
    match range.next() {
        Some(x) => {
            println!("{}", x);
        },
        None => { break }
    }
}
```

```rust
let nums = vec![1,2,3,4,5,6,7,8,9,10];
for num in nums {
    println!("{}", num);
}

// Implicitly does this:

for num in nums.iter() {
   println!("{}", num);
}

```

```rust
let nums = vec![1,2,3,4,5,6,7,8,9,10];
for i in 0..nums.len() {
    println!("{}", nums[i]);
}
```

If we want to mutate the data while we iterate, we use iter_mut:

```rust
let mut nums = vec![1,2,3,4,5,6,7,8,9,10];
for element in nums.iter_mut() {
    *element += 1;
}
```

Any others?
https://play.rust-lang.org/?version=stable&mode=debug&edition=2021

## Rust Closures
[Rust Book Chapter](https://doc.rust-lang.org/book/ch13-01-closures.html)
- Anonymous functions you can save in a variable or pass as arguments to other functions.
- Ownership and borrowing rules still apply

```rust
let lambda = |x| x + 3;
println!("{}",lambda(5));
```

## Rust Smart Pointer Example
[Rust Book Chapter](https://doc.rust-lang.org/book/ch15-05-interior-mutability.html)

`RefCell` allows us to mutate data, even when there are immutable references pointing to it. This is normally disallowed by borrowing rules, meaning that `RefCell` is **unsafe**. Borrowing rules are enforced at runtime, rather than compile time.

Quick review of the 3 smart pointers you've learned about so far: 
- Rc<T> enables multiple owners of the same data; Box<T> and RefCell<T> have single owners.
- Box<T> allows immutable or mutable borrows checked at compile time; Rc<T> allows only immutable borrows checked at compile time; RefCell<T> allows immutable or mutable borrows checked at runtime.
- Because RefCell<T> allows mutable borrows checked at runtime, you can mutate the value inside the RefCell<T> even when the RefCell<T> is immutable.

Take this new definition of a LinkedList: 
```rust
enum List {
    Cons(Rc<RefCell<i32>>, Rc<List>),
    Nil,
}
```

Compared to what we saw last week:
```rust
pub enum List {
    Cons(i32, Box<List>),
    Nil
}
```

What does this new definition allow us to do that our old one didn't, know that we know about Box, Rc, and RefCells

How we did it before (returning a new list):

```rust
    pub fn insert(self, n: i32) -> List {
        match self {
            Nil => Cons(n, Box::new(Nil)),
            Cons(x,y) => Cons(x, Box::new(y.insert(n)))
        }
    }
    
    pub fn reverse(self) -> List {
        match self {
            Nil => Nil,
            Cons(x,y) => y.reverse().insert(x)
        }
    }
```

Challenge: try to reverse this linkedlist definition in place
- helpful resource for above: https://rust-unofficial.github.io/too-many-lists/fourth-final.html
