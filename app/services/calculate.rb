class Calculate

    def initialize(operation, numbers)
        @operation = operation
        @numbers = numbers
    end


    def execute
        send(@operation, @numbers)
    end

    private

    def add(numbers)
        total = 0
        begin
            numbers.each do |n|
                total += n
            end
        rescue TypeError
            return { error: 'Cannot take a string' }
        end

        total
    end

    def multiply(numbers)
        total = 1
        begin
            numbers.each do |n|
                total *= n
            end
        rescue TypeError
            return { error: 'Cannot take a string' }
        end

        total
    end

    def divide(numbers)
        total = numbers.shift

        begin
            numbers.each do |n|
                total = total.fdiv(n)
            end
        rescue TypeError, NoMethodError
            return { error: 'Cannot take a string' }
        end

        total
    end

    def subtract(numbers)
        total = numbers.shift

        begin
            numbers.each do |n|
                total -= n
            end
        rescue TypeError, NoMethodError
            return { error: 'Cannot take a string' }
        end

        total
    end
end
