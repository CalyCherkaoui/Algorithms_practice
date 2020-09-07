=begin 

Linked List  

Implement the following two methods in your own LinkedList class. You should start with your code from yesterday:  

    add_at(index, item) - Add an item to a specific location in the list. The index will be a positive integer that represents the index where you should insert item. Zero is the position of the first element of the list. 
    remove(index) - Remove an item from a specific location in the List.  


You should also implement a private helper method get_node(index) to return the Node at a specific index.  

You should have already completed these two methods in the previous challenge:  

    add(number) - Add number to the end of your LinkedList. 
    get(index) - Get the number located at index.  


Example  

This is an example of a test case:  

list = LinkedList.new


list.add(3)

list.add(5)

list.add_at(1, 11)

list.add_at(0, 13)

puts list.get(2)

# => 11

=end

# Start with your code from last challenge.

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

  def add_at(index, item)
    if @head.nil? || index > self.list_count
      self.add(item)
    elsif index == 0
      # create the new node
      new_node = Node.new(item)
      # link the new node
      new_node.next_node = @head
      @head = new_node
    else
      # get the node at index
      cursor = self.get_node(index)
      # get the node before
      before_node = self.get_node(index-1)
      # create the new node
      new_node = Node.new(item)
      # link the new node
      before_node.next_node = new_node
      new_node.next_node = cursor
    end
  end

  def remove(index)
    if @head.nil? || index > self.list_count
      false
    elsif index == 0
      @head = @head.next_node
      true
    else
      tobe_removed = self.get_node(index)
      before_node = self.get_node(index - 1)
      before_node.next_node = tobe_removed.next_node
      tobe_removed = nil
      GC.start
      true
    end
  end

  def list_count
    # initialization
    if @head.nil?
      0
    else
      cursor = @head
      count = 1
      until cursor.next_node.nil?
        cursor = cursor.next_node
        count = count + 1
      end
      count
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

  # private

  def get_node(index)
    # initialization
    cursor = @head
    cursor_index = 0
    until cursor.next_node.nil? || cursor_index == index
      cursor = cursor.next_node
      cursor_index = cursor_index + 1
    end
    if cursor_index == index
      cursor
    else
      nil
    end
  end

end


list = LinkedList.new

list.add(3)
list.add(5)
list.add_at(1, 11)
list.add_at(0, 13)

puts list.get(2)
# => 11

puts list.get(3)
# => 5