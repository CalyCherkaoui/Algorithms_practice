=begin
  
Write a short program that prints each number from 1 to 100 on a new line. 

For each multiple of 3, print "Fizz" instead of the number. 

For each multiple of 5, print "Buzz" instead of the number. 

For numbers which are multiples of both 3 and 5, print "FizzBuzz" instead of the number.
  
=end

100.times do |i|
  i+=1
  if i%15==0
      puts "FizzBuzz"
  elsif i%5==0
      puts "Buzz"
  elsif i%3==0
      puts "Fizz"
  else
      puts i
  end
end
