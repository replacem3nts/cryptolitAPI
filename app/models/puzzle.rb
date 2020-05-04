class Puzzle < ApplicationRecord
    has_many :challenges


    def self.rand_by_difficulty(difficulty, user_puzzles)
        all_puzzles = Puzzle.find_by(difficulty: difficulty)
        choose_array = (all_puzzles - user_puzzles)
        choose_array.sample
    end
end
