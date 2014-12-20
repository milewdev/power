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
```


###Code Notes

-  To run tests:
   ```shell
   $ cd ~/work/power
   $ rake
   ```
-  Used Array instead of Set so array literals could be used in the tests, keeping things simple.
   As a result, Array#uniq is used here and there.  Also, Arrays can be sorted, simplifying
   comparisons in tests.
-  To keep the program simple, there is no checking that n is negative or too large.
-  Added #find_all in order to generate the solution in the problem statement;
-  There was no need to use an exception to stop the search.
-  Could not think of better names for #multiply_each and #multiply.
