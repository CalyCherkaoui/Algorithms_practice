=begin

Balanced Brackets
There are 3 kinds of Brackets: [] {} (). Given a String  of characters, check if all the brackets in the String are Balanced. A  string is balanced if all the start and end brackets are in a correct  order so they match each other.
Here are some balanced Strings:

    {}
    (hello)[world]
    [({}{}{})([])]


Here are some Unbalanced ones:

    (hello - no ending )
    ([)] - The [ is improperly enclosed in the ().
    )( - There's an ending ) without a ( before it.


Return true if a line is balanced and false otherwise.

Examples

The following are 3 test cases:

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true

=end

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

  def empty?
    if @stack.list_count == 0
      true
    else
      false
    end
  end
end

def matching_bracket (char)
  case char
    when ')'
      '('
    when '}'
      '{'
    when ']'
      '['
    else
      nil
  end
end

def extract_brackets (mystring)
  brackets_array = []
  my_string_array = mystring.split("")
  my_string_array.to_a.each do |char|
    if ['{', '}', '(', ')', '[', ']'].include?(char)
      brackets_array.push(char)
    end
  end
  brackets_array
end

def balanced_brackets?(my_string)
  open_brackets_stack = Stack.new
  extract_brackets(my_string).each do |char|
    if ['{', '(', '['].include?(char)
      open_brackets_stack.push(char)
    else
      poped = open_brackets_stack.pop
      if matching_bracket(char) != poped
        return false
      end
    end
  end

  return open_brackets_stack.empty?

end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true