=begin
Stack
Create a Stack with two methods push and pop. Use your LinkedList class to keep track of the elements internally.

Example

This is an example of a test case:

stack = Stack.new
stack.push(3)

stack.push(5)
puts stack.pop

# => 5


stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop

# => 2


puts stack.pop

# => 3

=end

# Start with your code from LinkedList challenge.
class Node
  attr_accessor :value, :next_node
  def initialize ( value = nil, next_node = nil )
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head
  
  def initialize ( head = nil )
    @head = head
  end
  
  def add(number)
    if @head.nil?
      @head = Node.new(number)
    else
      cursor = @head
      until cursor.next_node.nil?
        cursor = cursor.next_node
      end 
      cursor.next_node = Node.new(number, nil)
    end
  end

end 

class Stack
  
  def initialize
    @stack = LinkedList.new
  end

  def push(number)
    @stack.add(number)
  end
  
  def pop
    if @stack.head.nil?
      nil
    elsif @stack.head.next_node.nil?
      pop_val = @stack.head.value
      @stack.head = nil
      GC.start
      return pop_val
    else
      cursor = @stack.head
      until cursor.next_node.next_node.nil?
        cursor = cursor.next_node
      end
      pop_val = cursor.next_node.value
      cursor.next_node = nil
      GC.start
      return pop_val
    end
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3