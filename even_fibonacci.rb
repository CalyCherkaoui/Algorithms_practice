=begin

Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

  Sample Input 0

2
10
100

Sample Output 0

10
44

Sources: https://www.hackerrank.com/contests/microverse-coding-challenges/challenges/euler002

=end

def sum_even_fib(num)
  return 0 if num < 2
  # after expansion of fib terms even terms are : FibN = 4 * FibN_3 + FibN_6
  # initialize terms of recursion
  fibn_6 = 0
  fibn_3 = 2
  fibn = 8
  cumulator = 2

  while (fibn) <= num
    fibn = 4 * fibn_3 + fibn_6
    cumulator += fibn
    fibn_6 = fibn_3
    fibn_3 = fibn
    fibn = 4 * fibn_3 + fibn_6
  end

  cumulator
end