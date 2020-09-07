/* 
John works at a clothing store. He has a large pile of socks that he must pair by color for sale. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.

For example, there are
socks with colors . There is one pair of color and one of color . There are three odd socks left, one of each color. The number of pairs is

.

Function Description

Complete the sockMerchant function in the editor below. It must return an integer representing the number of matching pairs of socks that are available.

sockMerchant has the following parameter(s):

    n: the number of socks in the pile
    ar: the colors of each sock

Sample Input

9
10 20 20 10 10 30 50 10 20

Sample Output

3

Source: https://www.hackerrank.com/challenges/sock-merchant/problem
*/

function sockMerchant(n, ar) {
  //sorting ar
  ar.sort(function (a,b){ return a-b});
  // initialisation of notPaired indicator and the counter
  let notPaired=true;
  let counter=0;
  for (let i=1; i<ar.length; i++){
      if( ar[i]==ar[i-1] && notPaired){
          counter=counter+1;
          notPaired=false;
      } else {
          notPaired=true;
      }
  };
  return counter;

}