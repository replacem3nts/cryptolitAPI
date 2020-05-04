class User < ApplicationRecord
    has_many :challenges
    has_many :puzzles, through: :challenges
end
