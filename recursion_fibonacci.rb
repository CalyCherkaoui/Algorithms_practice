# def fibonacci(n)
#   sequence = []
#   (0..n).each do |n|
#       if n < 2
#           sequence << n
#       else
#           sequence << sequence[-1] + sequence[-2]
#       end
#   end
#   sequence.last
# end

def fibonacci(n)
  if n < 2
      n
  else
      fibonacci(n-1) + fibonacci(n-2)
  end
end

puts fibonacci(20)
