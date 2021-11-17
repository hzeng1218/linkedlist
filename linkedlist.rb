class LinkedList
    attr_accessor :head, :tail
    def initialize(head = nil, tail = nil)
        @head = head
        @tail = tail
        @size = 0
    end
    def append(value)
        if @tail.nil?
            @head = Node.new(value)
            @tail = @head
        else
            @tail.next_node = Node.new(value)
            @tail = @tail.next_node
        end
        @size += 1
    end
    def prepend(value)
        if @head == @tail
            append(value)
        else
            @head.next_node = Node.new(value)
            @head = @head.next_node
            @size += 1
        end
    end   
    def size
        @size
    end
    def at(index)
        current_node = @head
        if index >= size || @head.nil?
            return nil
        end
        index.times do
            #p "hello"
            current_node = current_node.next_node
            #p current_node
        end
        # p current_node
        current_node
    end
    def pop
        returnedtail = @tail
        if size == 0
            nil
        elsif size == 1
            @head = nil
            @tail = nil
        else
            @tail = at(size-2)
            @tail.next_node = nil
        end
        returnedtail
    end
    def contains?(value)
        current_node = @head
        until current_node.nil?
            if current_node.value == value
                return true
            else
            current_node = current_node.next_node
            end
        end
        false
    end
    def find(value)
        index = 0
        current_node = @head
        if contains?(value)
            until current_node.nil?
                current_node = current_node.next_node
                index += 1
            end
        else
            return nil
        end
        index
    end
    def to_s
        string = ''
        current_node = @head
        if @head.nil?
            string
        end
        until current_node.nil?
            string += "( #{current_node.value} ) -> "
            current_node = current_node.next_node
            end
        string += 'nil'
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

list = LinkedList.new()
list.append('1')
list.append('2')
list.append('3')
# list.prepend('hello')
# list.prepend('hello')
# list.prepend('hello')
# list.prepend('hello')
p list.pop
p list.at(1)
# list.pop
#p list.head
#p list.tail
#p list.size