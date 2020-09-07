=begin

Queue
Create a Queue with the two methods add and remove. Use your LinkedList class to keep track of the elements internally.
In this challenge, there's one more detail: If remove is called on the empty Queue, return -1.

Example

This is an example of a test case:

queue = Queue.new

queue.add(3)
queue.add(5)
puts queue.remove

# => 3


queue.add(2)
queue.add(7)
puts queue.remove
# => 5

puts queue.remove

# => 2


puts queue.remove

# => 7


puts queue.remove

# => -1


The numbers come out in the order they went in, and the final remove returns a -1 since the queue is empty.

=end
# Start with your code from LinkedList challenge.
class Node
  attr_accessor :value, :next_node
  
  def initialize(value = nil, next_node = nil )
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head
  
  def initialize( head = nil )
    if head.nil?
      @head = nil
    else
      @head = Node.new(head.value, nil)
    end
  end

  def add_L( number )
    if @head.nil?
      @head = Node.new( number )
    else
      cursor = @head
      until cursor.next_node.nil?
        cursor = cursor.next_node
      end
      cursor.next_node = Node.new( number )
    end
  end
end

class Queue
  
  def initialize
    @queue = LinkedList.new
  end
  
  def add(number)
    @queue.add_L(number)
  end
  
  def remove
    if @queue.head.nil?
      return -1
    else
      val = @queue.head.value
      @queue.head = @queue.head.next_node
      GC.start
      return val
    end
  end
end

queue = Queue.new

queue.add(3)
queue.add(5)
puts queue.remove
# => 3

queue.add(2)
queue.add(7)
puts queue.remove
# => 5

puts queue.remove
# => 2

puts queue.remove
# => 7

puts queue.remove
# => -1