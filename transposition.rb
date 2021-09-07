=begin
Transposition
A Transposition Error is when two letters are swapped, such as in "hte" instead of "the", or "rign" instead of "ring".
Given a string of characters, can you fix every place where "gn"  appears so it becomes "ng" instead? If there are multiple "g"s in a row,  the "n" should be swapped with the first "g". No "gn" should appear in  the final text, so be careful with all possibilities!

Full Credit

Try to solve this challenge with only one pass through the text.

Examples

The following are 3 test cases:

puts transpose('he was searchign on Bign for signign kigns')

# => he was searching on Bing for singing kings


puts transpose('rignadingdiggn!')

# => ringadingdingg!


puts transpose('gngngnnggnngggnnn')

# => nnnnnnnnngggggggg
=end


def transpose(string)
  string_array = string.split("")
  result_arr = []

  loop do

    if (string_array[0] != 'g' || string_array.size == 1)
      result_arr << string_array.shift
    else
      a = string_array[0]
      b = string_array[1]
      string_array[0] = b
      string_array[1] = a
    end

    break if string_array.size == 0
  end

  result_arr
end

# puts transpose('he was searchign on Bign for signign kigns') == 'he was searching on Bing for singing kings'
# => he was searching on Bing for singing kings


# puts transpose('rignadingdiggn!') == 'ringadingdingg!'
# => ringadingdingg!

# puts transpose('gngngnnggnngggnnn') == 'nnnnnnnnngggggggg'
# => nnnnnnnnngggggggg
=begin 
result_arr = []
s = 'gngn'
string_array = s.split("")

p string_array
p string_array.size

p result_arr.push(string_array.shift)
p string_array
p string_array.size

p result_arr

# a = string_array[0]
# b = string_array[1]
# string_array[0] = a
# string_array[1] = b

# p string_array
# p string_array.size
=end

