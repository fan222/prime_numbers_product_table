# prime_numbers_product_table

## Objective
Write a program that prints out a multiplication table of the first 10 prime number.
- [ ] The program must run from the command line and print one table to STDOUT.
- [ ] The first row and column of the table should have the 10 primes, with each cell
containing the product of the primes for the corresponding row and column.

## Background

### Primality Test VS. Sieve of Eratosthenes
A naive way to check primality is trial division. For a given number n, if any factor other than 1 and the number itself exits, then this number is composite, otherwise it's prime. But this method is too slow. It requires O(sqrt(n)) operations to check one number.

The Baillie–PSW primality test is a probabilistic primality testing algorithm. This method is pretty reliable. (No composite number below 2 ** 64 (approximately 1.845 * 10 ** 19) passes the Baillie-PSW test.[1] [BPSW]) And BPSW requires O((log n) ** 3) bit operations.[2] [TRN]

Both method above are no very good.

The number of prime numbers below a given number n is approximately n/ln(n)[3] [NP]. In another word, to find n/ln(n) prime numbers, trial division requires O(sqrt(n) * n) operations. Baillie–PSW needs O(((log n) ** 3) * n). But Sieve of Eratosthenes only needs O(n * (loglogn)). That is much faster.

### "Caching"?
Based discussions above, no matter what method you use, find prime numbers are very expensive.
Why not 'cache' those numbers? Saving new primes to an array, if numbers for later request have already been found, a simple array slicing will give you what you what.

## Implementation

I have three class, NumberTable, PrimeNumber, Table.
NumberTable is responsible for interacting with users in command line.

PrimeNumber find n prime numbers. If required prime numbers already exist, used saved numbers.Otherwise, compute them
```ruby
  if n <= @primes.length
    [@primes[0...n], false]
  else
    diff = @primes.length
    [find_prime_numbers(n), true, diff]
  end
```

Table makes table using result PrimeNumber provides.


## TODO

- [ ] The basic Sieve of Eratosthenes requires O(n) of memory. For ruby, Max Fixnum is (2 ** (64 - 2) -1), which is approximately 10 ** 18. It is impossible to store all these numbers in one array. One way to tackle this problem is to split the array into several chunks, and check those chunks one by one. Another way is to try primality test, like Baillie–PSW primality test, if one care memory more than speed.

- [ ] For Sieve of Eratosthenes, using wheel factorization or wheel sieve can further improve speed.

- [ ] Instead forming a new array each time, those 'cached' prime numbers can help further reduce size of the initial array.

[BPSW]: http://www.trnicely.net/misc/bpsw.html
[TRN]: http://www.trnicely.net/misc/bpsw.html
[NP]: https://en.wikipedia.org/wiki/Prime_number
