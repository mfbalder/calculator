require '/Users/mfbalder/Documents/coding/calculator/app/services/calculate.rb'

class CalculationController < ApplicationController

    OPERATIONS = ['add', 'subtract', 'multiply', 'divide']

    def calculate
        operation = params['operation']

        begin
         numbers = JSON.parse(params['numbers'])
        rescue JSON::ParserError
            return render_400
        end

        return render_400 unless validate_operation(operation) && validate_number_length(numbers)
        
       
        result = Calculate.new(operation, numbers).execute

        if result
            Calculation.create!(
                operation: operation,
                numbers: numbers,
                total: result
            )
        end

        render json: {
            result: result,
            status: 200
        }, status: 200
    end

    def directory
        if params['id']
            result = Calculation.find_by(id: params['id'])
        else
            result = Calculation.all
        end

        return render_404 if result.nil?

        render json: {
            result: result,
            status: 200
        }, status: 200

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

    def render_400
        render json: {
            error: "Cannot operate on strings",
            status: 400
        }, status: 400
    end

    def render_404
        render json: {
            error: 'Record not found',
            status: 404
        }, status: 404
    end
end
