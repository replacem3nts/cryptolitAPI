class User < ApplicationRecord
    has_many :challenges
    has_many :puzzles, through: :challenges

    def puzzle_ids
        id_array = puzzles.map(&:id)
    end

    def solved_challenges
        challenges.select {|challenge| challenge.solved == true}
    end

end
