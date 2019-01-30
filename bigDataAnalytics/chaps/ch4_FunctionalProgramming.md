# Functional Programming
## Functional Programming in PySpark

Various programming languages implement the functional paradigm,
including Java via Lambdas, D, Python and Scala. 

Relative to standard procedural languages such as C and Java, functional
programming allows to program with relatively concise statements that
reflect mathematical expressions (accordance with formal mathematical
provability). This is because functional programming breaks a problem
into specialized functions connected by input and output. 

Modularity is a byproduct of breaking a problem into is smallest parts,
each represented by a function. Programs that are comprised of many
distinct small functions, each performing a single task, are more
maintainable than a large complicated function (effectively a program).
In turn, a benefit of the modularity afforded by functional constraints
includes quicker prototyping.

Formally, functional programming entails immutable objects, and if a
language is “purely functional,” then there are no side effects (that
alter some system state apart from the function itself). Hence, a
function's output always depends on an explicit input. This also means
that objects are not changed by a function. Instead, a new object is
created for output, as is the case with Spark's central data structure,
the Resilient Distributed Dataset or RDD.

Functions in a functional programming language may be “higher order
functions,” meaning that they accept other functions as arguments and
are able to return a function. Typical examples of higher order
functions include map, reduce and filter. Such higher order functions
exist in PySpark.  

Because functional languages put constraints on side effects, functions
and their processes can operate independently, which is required for
asynchronous parallel operations. That way the processes of various
functions do not contest the same objects or system resources, which
would slow processing.

### Lazy evaluation

Lazy evaluation is another characteristic of functional programming.
Lazy evaluation reserves the evaluation of an expression until it is
needed. This facilitates modularization since it may not be known which
function or expression should ultimately be engaged. This goes
hand-in-hand with being side-effect free, so that program behavior is
not affected by the order of evaluation. 

### Lambda expressions

In several languages that support functional programming, a facility
called lambdas that accommodates small user defined, or anonymous,
functions that can be passed as parameters to other functions. 

Python has a functional programming library called functools. PySpark
readily accommodates functional programming.

In Python, a lambda expression combines parameters into an “anonymous
function” such as:
```
lambda x, y: x * y
```
We can assign this lambda to a variable such as: 
```
product = lambda x, y: x * y
```
and affect the lambda as:
```
print(product(2,3))        →         6
```
In other words, we assigned the anonymous function to “product” and
passed it as a parameter to the print() function. However, we need not
even name the function. For example:
```
result = otherFunction(lambda x, y: x * y)
```
This arrangement enforces narrow functionality. This is unlike defining
a using the “def” keyword in Python, which encourages line-after-line of
alternative actions for the function to take.

To use conditional expressions, we can have: 
```
fn = lambda L, R: ("Go Left", L, R) if L > 5 and R < 10 else ("Go Right", L, R)
print(fn(5,15))        →        ('Go Right', 5, 15)
```

### Higher order functions

Higher order functions (aka “functors”) accept other functions as
arguments and are able to return a function. Examples of higher order
functions include map, filter, flatMap and reduce.

#### `map`

The map function applies another function to a list of values. Its
output is a new list of transformed elements. 

map takes two arguments: 
```
map(function, list)
```
For example, suppose we have a list of exam grades:

grades = \[30, 35, 55, 70, 45, 60\]

To scale all exam grades up by 10 points, map a lambda as follows:

grades\_adj = list(map(lambda a: a + 10, grades))

list(grades\_adj)→\[40, 45, 65, 80, 55, 70\]

reduce: Like map, reduce applies a function to a list of values. Unlike
map, the output of reduce is an aggregate of the list. The operation of
reduce is pairwise such that for elements a, b, the pairing “a + b, b”
creates a sum aggregate. For example:

ints = \[2, 4, 6, 8\]

sum = lambda a, b: a + b

avg = reduce(sum, ints)/len(ints)

print(avg)→20

filter: used to filter data, conditionally allowing some data to pass
without modifying it. Hence, the resulting list may be shorter than the
input list.

ok = lambda a: a \> 0

ints = \[2, -4, 6, -8\]

pos\_ints = filter(ok, ints)

print(pos\_ints)→\[2, 6\]

flatMap: the map function may yield multiple sub lists. If a single
“flattened” list is preferred, then use flatMap.

For example, in PySpark suppose the following 

sc.parallelize(grades).map(lambda a: \[a, a + 10\]).collect() 

→ \[\[30, 40\], \[35, 45\], \[55, 65\], \[70, 80\], \[45, 55\], \[60,
70\]\]

Using flatMap we get:

sc.parallelize(grades).flatMap(lambda a: \[a, a + 10\]).collect() 

→ \[30, 40, 35, 45, 55, 65, 70, 80, 45, 55, 60, 70\]

… with results “flattened” into one single list. So, given a couple sets
of grade provided as:

Similarly, given nested lists such as:

grades = \[\[20, 40, 60, 80\], \[10, 30, 50, 70\]\]

We can flatten the list into a single list as follows:

sc.parallelize(grades).flatMap(lambda a: a).collect() 

→ \[20, 40, 60, 80, 10, 30, 50, 70\]

That is enough of a functional programming overview for this module. For
more functional programming material and Python basics, please visit the
other Python and Functional Programming modules. 

The concepts of map and reduce as seen in Python evolve in the
distributed context of the Spark environment, where map performs
transformations while another function “collect” is responsible for
retrieving transformed elements.

Related Internet resources:

<https://en.wikipedia.org/wiki/Functional_programming>

<https://en.wikipedia.org/wiki/Currying> 

<https://docs.python.org/2.7/library/functools.html> 

<https://en.wikipedia.org/wiki/Higher-order_function>

### Exercises

1\. Using Python, given a list of pets:

pets = \['dogs', 'cats', 'birds', 'fish'\]

Use the map function to print the character count comprising each pet
type.  

2\. Given the list:

nums = \[1, 2, 3, 4, 5, 6, 7, 8, 9\]

Devise a lambda function to yield a list of only the odd integers. 

3\. Using Python, given a list of pairs, pets with their associated
count, as (pet, count):

pets = \[('dogs', 5), ('cats', 3), ('birds', 7), ('fish', 4)\]

Devise lambda functions to do the following:

A. Sort the pets alphabetically by type.

B. Sort the pets numerically by count.

C. Retrieve the total count of all pets.

Hint: Lists contain a sort function.

Submit your code and output from executing your programs.
