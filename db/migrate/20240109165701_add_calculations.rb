class AddCalculations < ActiveRecord::Migration[7.1]
  def up
      create_table :calculations do |t|
        t.string :operation, null: false, comment: 'The mathematical operation executed on the input.'
        t.json :numbers, null: false, comment: 'An array of numerical input to calculate on, in the form of JSON.'
        t.float :total, null: false, comment: 'The calculated total.'
        t.timestamps
      end
  end

  def down
    drop_table :calculations
  end
end
