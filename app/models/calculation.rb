class Calculation < ApplicationRecord
    validates :operation, :numbers, :total, presence: true
end
