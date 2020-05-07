class Puzzle < ApplicationRecord
    has_many :challenges

    def self.id_by_diff(difficulty)
        id_array = where(difficulty: difficulty).map(&:id)
    end
end
