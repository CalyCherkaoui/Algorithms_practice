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
        @head = Node.new(number, nil)
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

    attr_accessor :stack

    def initialize
        @stack = LinkedList.new
    end
  
    def push(number)
      @stack.add( number )
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
    
    def min
      if @stack.head.nil?
        -1
      else
        min_val = @stack.head.value
        cursor = @stack.head
        until cursor.next_node.nil?
           #puts "loop entry cursor #{cursor.value}" 
          cursor = cursor.next_node
          #puts "loop exit cursor #{cursor.value}" 
          if cursor.value <= min_val
            min_val = cursor.value
          end
        end      
        min_val
      end
    end
  
end


  
stack = Stack.new
#p stack.stack.head
#p stack.min
stack.push(3)
#p stack.stack.head.value
#p stack.min
stack.push(5)
#p stack.stack.head.value
#p stack.min
stack.push(2)
p stack.stack
p stack.min
  
=begin
  stack.pop
  stack.push(7)
  puts stack.min
  # => 3
  
  stack.push(2)
  puts stack.min
  # => 2
  
  stack.pop
  puts stack.min
  # => 3
=end
