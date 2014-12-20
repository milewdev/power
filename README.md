###What is power?

power finds the smallest set of multiplications required to raise any number to
the nth power. It can also find all such smallest sets when there is more than
one (n > 4?).  For example, a minimum set of multiplications required to raise a
value to the 9th power is [1, 2, 3, 6, 9], i.e. four multiplications:

```ruby
x2 = x * x
x3 = x * x2
x6 = x3 * x3
x9 = x3 * x6
```

Compare this with the 8 multiplications required to do it the long way:

```ruby
x9 = x * x * x * x * x * x * x * x * x
```


###Installation

To install power in, for example, ~/work/power:

```shell
$ git clone https://github.com/milewdev/power.git ~/work/power
```


###Usage

Change to the directory where power is installed:

```shell
$ cd ~/work/power
```

To find the smallest set of multiplications required to raise any number to the nth power:

```shell
$ ./find 9
[1, 2, 3, 6, 9]
$
```

To find all of the smallest sets of multiplications required to raise any number to the nth power:

```shell
$ ./find_all 9
[[1, 2, 3, 6, 9], [1, 2, 4, 5, 9], [1, 2, 4, 8, 9]]
$
```


###Code Notes

-   There are two entry points into the power library, ```Power#find(n)```
and ````Power#find_all(n)```.  Both are in the file ```lib/power.rb```.  n is
the exponent, as in ```x ** n```.

-   power finds solutions by generating sets of successive multiplications until one
(or more) sets are found containing the sought exponent n.  Given a set of
exponents [i,j,k,...] that does not contain n, power generates new sets to
search by generating all possible unique combinations of multiplications of the
elements in the set. Since ```x**i * x**j``` is the same as ```x**(i+j)```, new
multiplications can be found by simply generating all combinations of adding
pairs of numbers in the set.  For example, [1,2] will generate the numbers 1+1,
1+2, 2+2, or 2,3,4 (```Power#next_values```).  New sets are created by adding
each of these numbers to the original set, so this results in [1,2,2],
[1,2,3], and [1,2,4] \(```Power#multiply``` and ```Power#build_set```).  Sets with
duplicate elements, such as [1,2,2], are discarded as we only want to do any
given multiplication once, so we end up with [1,2,3] and [1,2,4].

    If n is not in any of the newly generated sets, then each of those sets is used
to produce the next generation of sets, and so on (```Power#find_all```
and ```Power#multiply_each```).

-   To run tests:

    ```shell
    $ cd ~/work/power
    $ rake
    ```

-   Arrays were used instead of Sets so that array literals could be used in the
tests, keeping things simple. As a result, Array#uniq is used here and there.
Also, Arrays can be sorted, simplifying comparisons in tests.

-   Power itself does no bounds or type checking on n.  The
scripts ```find``` and ```find_all``` do rudimentary checks.

-   ```#find_all``` was implemented in order to show that the program generates the
solution listed in the problem statement, [1, 2, 4, 5, 10, 15].  The solution
returned by ```#find``` is [1, 2, 3, 5, 10, 15].

-   As ```#find_all``` finds all solutions and ```#find``` invokes ```#find_all```,
an exception was not used to end the search the moment a solution was found.  This
optimization could be added to ```#build_set```, for example.

-   Another optimization would be to note that due to the commutative nature of
addition (2+1 is the same as 1+2), only a little over half (n*(n+1)/2) of the
pair combinations actually need to be generated.

-   Class ```Power``` and methods ```#find```, ```#find_all```, ```#multiply_each```,
and ```#multiply``` deserve better names.
