=begin

Lists  

Create your own LinkedList  class for storing integers which should include two methods:  

    add(number) - Add a new Node to the end of the list with a value of number. Nothing needs to be returned. 
    get(index) - Return the value of the Node at position `index` in the List.   


Example  

This is an example of a test case:  

list = LinkedList.new


list.add(3)

list.add(5)

puts list.get(1)

# => 5

The 2 add operations create the list: [3, 5]. 
The get operation, gets the number located at position 1. 

  
=end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value = nil, next_node = nil)
	  @value = value
    @next_node = next_node
  end
end

class LinkedList
  #setup head and tail
  attr_accessor :head

  def initialize(head = nil)
    if head.nil?
      @head = nil
    else
      @head = Node.new(head.value, nil)
    end
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

  def get(index)
    cursor = @head
    cursor_index = 0
    until cursor.next_node.nil? || cursor_index == index
      cursor = cursor.next_node
      cursor_index = cursor_index + 1
    end
    if cursor_index == index
      cursor.value
    else
      nil
    end
  end
end

list = LinkedList.new
list.add(3)
list.add(5)
puts list.get(1)
# # => 5