class LinkedList
    attr_accessor :head, :tail
    def initialize(head = nil, tail = nil)
        @head = head
        @tail = tail
    end
    def append(value)
        if @tail.nil?
            @head = Node.new(value)
            @tail = @head
        else
            @tail.next_node = Node.new(value)
            @tail = @tail.next_node
        end
    end
    def prepend(value)
        if @head == @tail
            append(value)
        else
            @head.next_node = Node.new(value)
            @head = @head.next_node
        end
    end   
    def size
        counter = 0
        current_node = @head
        until current_node.nil?
            counter += 1
            current_node = current_node.next_node
        end
        counter
    end
    def at(index)
        current_node = @head
        if index >= size && @head.nil?
            return nil
        end
        index.times do
            current_node = current_node.next_node
        end
        current_node
    end
    def pop
        unless @head == nil
            if @tail.nil?
                return nil
            end
            if @head == @tail && size == 1
                @head = nil
                @tail = nil
            end
            @tail = at(size-2)
            @tail.next_node = nil
        end
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
list.append('hello')
list.prepend('hello')
p list.head
p list.tail
p list.size
p list.to_s