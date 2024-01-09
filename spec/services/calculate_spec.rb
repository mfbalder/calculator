require '/Users/mfbalder/Documents/coding/calculator/app/services/calculate.rb'

RSpec.describe Calculate do
    subject { Calculate.new(operation, numbers) }

    describe "#add" do
        context "with valid numbers" do
            let(:numbers) { [1, 2, 3] }
            let(:operation){ 'add' }

            it 'should sum the numbers' do
                expect(subject.execute).to equal(6)
            end
            
        end

         context 'with floats for numbers' do
            let(:numbers) { [1.1, 2.2, 3.1] }
            let(:operation){ 'add' }

            it 'should sum the numbers' do
                expect(subject.execute).to equal(6.4)
            end
         end

         context "with negative numbers" do
            let(:numbers) { [-20, -10, 5] }
            let(:operation){ 'add' }

            it 'should sum the numbers' do
                expect(subject.execute).to equal(-25)
            end
         end

         context 'with a string in the number input' do
            let(:numbers) { ['hi', 2, 3] }
            let(:operation){ 'add' }

            it 'should return an error' do
                expect(subject.execute).to include(:error)
            end
         end
    end

    describe "#multiply" do
        context "with valid numbers" do
            let(:numbers) { [1, 2, 3] }
            let(:operation){ 'multiply' }

            it 'should multiple the numbers' do
                expect(subject.execute).to equal(6)
            end
            
        end

        context 'with floats for numbers' do
            let(:numbers) { [1.5, 2, 3] }
            let(:operation){ 'multiply' }

            it 'should multiply the numbers' do
                expect(subject.execute).to equal(9.0)
            end
        end

        context "with negative numbers" do
            let(:numbers) { [-10, 2, -10] }
            let(:operation){ 'multiply' }

            it 'should multiply the numbers' do
                expect(subject.execute).to equal(200)
            end
         end

        context 'with a string in the number input' do
            let(:numbers) { ['hi', 2, 3] }
            let(:operation){ 'multiply' }

            it 'should return an error' do
                expect(subject.execute).to include(:error)
            end
        end
    end

    describe "#divide" do
        context "with valid numbers" do
            let(:numbers) { [10, 2, 2] }
            let(:operation){ 'divide' }

            it 'should divide the numbers' do
                expect(subject.execute).to equal(2.5)
            end
            
        end

        context 'with floats for numbers' do
            let(:numbers) { [10, 0.5, 2] }
            let(:operation){ 'divide' }

            it 'should divide the numbers' do
                expect(subject.execute).to equal(10.0)
            end
        end

        context "with negative numbers" do
            let(:numbers) { [-20, 2, 2] }
            let(:operation){ 'divide' }

            it 'should divide the numbers' do
                expect(subject.execute).to equal(-5.0)
            end
         end

        context 'with a string in the number input' do
            let(:numbers) { ['hi', 2, 3] }
            let(:operation){ 'divide' }

            it 'should return an error' do
                expect(subject.execute).to include(:error)
            end
        end
    end

    describe "#subtract" do
        context "with valid numbers" do
            let(:numbers) { [20, 10, 5] }
            let(:operation){ 'subtract' }

            it 'should subtract the numbers' do
                expect(subject.execute).to equal(5)
            end
        end

        context 'with floats for numbers' do
            let(:numbers) { [20, 0.5, 0.5] }
            let(:operation){ 'subtract' }

            it 'should subtract the numbers' do
                expect(subject.execute).to equal(19.0)
            end
        end

        context "with negative numbers" do
            let(:numbers) { [-10, -5, 5] }
            let(:operation){ 'subtract' }

            it 'should subtract the numbers' do
                expect(subject.execute).to equal(-10)
            end
         end

        context 'with a string in the number input' do
            let(:numbers) { ['hi', 2, 3] }
            let(:operation){ 'subtract' }

            it 'should return an error' do
                expect(subject.execute).to include(:error)
            end
        end
    end
end