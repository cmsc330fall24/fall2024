# Discussion 10 - Friday, November 1st

## Reminders

- Exam 2 on **November 6th/7th**
- Exam 2 Logistics [@862](https://piazza.com/class/lzthtu8sxwsmm/post/862)
- Exam 2 Review Session on **Monday, November 4th, at 6 PM** in IRB0324 [@925](https://piazza.com/class/lzthtu8sxwsmm/post/925)
- Project 5 assigned and due on **Nov 13th, 2024**

## (More) Lambda Calculus Notes

### Bound Variable Clarification

Lambda parameters are not considered bound variables. For instance, the expression `Lx.y` has no bound variables. If we had `Lx.y x`, the only bound variable in this expression would be the `x` at the end.

## Garbage Collection Aside

In lecture, we learned about three main ways to do garbage collection:

* **Reference Counting** - Keep track of how many references point to a piece of memory, and free that memory once the counter reaches 0.
* **Mark & Sweep** - Has two phases, mark and sweep. In the mark phase, we mark all chunks of memory reachable via the stack. In the sweep phase, we go through the heap and deallocate all non-marked (non-reachable) chunks of memory. 
* **Stop & Copy** - Similar to Mark & Sweep, but instead of freeing unreachable heap memory segments, we copy them to an alternate partition. Once a partition is completely freed from stack references, we swap to using that partition.

## Exercises

### Reference Counting

Consider the following stack + heap layout:

![](./imgs/ref_count.png)

1. What would a reference counter diagram look like for this problem?
2. What would the diagram look like after the variable `x4` is popped off the stack?
   - Continue this example for `x3`, `x2`, and finally `x1`.

### Mark & Sweep

Suppose we have the following layout for the stack and heap:

![](./imgs/mark_sweep.png)

1. Indicate the freed segments of memory after one pass of Mark & Sweep.
2. Remove the variable `x4` from the stack. What does the diagram look like now?
3. Remove the variables `x2` and `x3`, but keep `x1` and `x4` in the stack. What does the diagram look like now?

[Solutions :> ඞ](https://github.com/cmsc330fall24/fall2024/blob/main/discussions/d10_garbage_collection/SOLUTIONS.md)

### Additional Resources
- [Cliff's Garbage Collection Notes](https://bakalian.cs.umd.edu/assets/notes/gc.pdf)
- [Anwar's Garbage Collection Slides](https://bakalian.cs.umd.edu/assets/slides/23-memory-management.pdf)
