=begin
  
Given a string of lowercase letters in the range ascii[a-z], determine a character that can be removed to make the string a palindrome. There may be more than one solution, 
but any will do. For example, if your string is "bcbc", you can either remove 'b' at index 0 or 'c' at index 3. If the word is already a palindrome or there is no solution, 
return -1. Otherwise, return the index of a character to remove.

Function Description

Complete the palindromeIndex function in the editor below. It must return the index of the character to remove or -1

palindromeIndex has the following parameter(s):

    s: a string to analyze

Input Format

The first line contains an integer q, the number of queries.
Each of the nextq  lines contains a query string Si

Output Format

Print an integer denoting the zero-indexed position of the character to remove to make s
a palindrome. If s is already a palindrome or no such character exists, print -1

Sample Input

3
aaab
baa
aaa

Sample Output

3
0
-1

Explanation

Query 1: "aaab"
Removing 'b' at index 3 results in a palindrome, so we print 3 on a new line.

Query 2: "baa"
Removing 'b' at index 0 results in a palindrome, so we print 0 on a new line.

Query 3: "aaa"
This string is already a palindrome, so we print -1 .Removing any one of the characters would result in a palindrome, but this test comes first.

sources: https://www.hackerrank.com/contests/microverse-coding-challenges/challenges/palindrome-index
  
=end

def palindromeIndex(s)
  s_array = s.split('')
  if s_array == s_array.reverse
      - 1
  else
      index = - 1
      buffer = s_array.clone
      for i in 0..(s_array.size - 1) do
          buffer.delete_at(i)
          if buffer == buffer.reverse
              index = i
              break
          else
              buffer = s_array.clone
          end
      end
      index
  end
end
