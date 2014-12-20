power
=====

power (WIP)


Code Notes
==========
-  Used Array instead of Set so array literals could be used in the tests, keeping things simple.
   As a result, Array#uniq is used here and there.  Also, Arrays can be sorted, simplifying
   comparisons in tests.
-  To keep the program simple, there is no checking that n is negative or too large.
-  Added #find_all in order to generate the solution in the problem statement;
