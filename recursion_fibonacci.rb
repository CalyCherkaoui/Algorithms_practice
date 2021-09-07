def fibonacci(n)
  sequence = []
  (0..n).each do |n|
      if n < 2
          sequence << n
      else
          sequence << sequence[-1] + sequence[-2]
      end
  end
  sequence.last
end

puts fibonacci(20)
