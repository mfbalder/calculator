require '/Users/mfbalder/Documents/coding/calculator/app/services/calculate.rb'

class CalculatorController < ApplicationController

    OPERATIONS = ['add', 'subtract', 'multiply', 'divide']

    def calculate
        operation = params['operation']
        numbers = JSON.parse(params['numbers'])

        validate_operation(operation)
        validate_number_length(numbers)

        result = Calculate.new(operation, numbers).execute

        render json: result
    end

    private

    def validate_operation(operation)
        return false if operation.class != String

        return false unless OPERATIONS.include? operation

        true
    end

    def validate_number_length(numbers)
        return false if numbers.length > 100

        true
    end
end
