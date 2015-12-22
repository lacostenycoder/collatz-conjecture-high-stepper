# Collatz Conjecture High Steps Solver

A simple ruby program using the Collatz Conjecture to find the number with greatest number of steps to reach zero.
Includes explaination and timer as calculations grow with big numbers.  Solves up to 1,000,000 in 10 seconds or less.  

In order to improve performance on large numbers, key value pairs are now stored in a local json file created/updated dynamically if the input key is not already in file.  This might be seen as cheating, but for now I have not found a faster solution.  The original approach of block passed to hash worked well. I moved the block into a lambda to return value where item already exists in the hash.

This was asked of me on a code test where the developer testing me suggested I used recursion but I found recursion for
this problem to blow up my computer.  Please let me know if you find a better solution or a way where recursion works.

=======

##### Cross reference step checking here:
[http://skanderkort.com/collatz_conjecture_calculator](http://skanderkort.com/collatz_conjecture_calculator)
