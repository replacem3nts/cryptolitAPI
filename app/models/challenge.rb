class Challenge < ApplicationRecord
  belongs_to :user, dependent: true
  belongs_to :puzzle

  def self.generate(username, difficulty)
    user = get_user(username)
    puzzle = get_puzzle(difficulty, get_user_puzzles(user))
    Challenge.create(user: user, puzzle: puzzle)
  end


  private

  def get_user(username)
    User.find_by(username: username)
  end

  def get_user_puzzles(user)
    user.puzzles
  end

  def get_puzzle(difficulty, user)
    Puzzle.rand_by_difficulty(difficulty)
  end

end
