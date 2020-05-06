class Challenge < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :puzzle

  def self.make_new(difficulty, id)
    user = get_user(id)
    puzzle_id = select_puzzle(difficulty, user)
    puzzle_id ? Challenge.create(user: user, puzzle: get_puzzle(puzzle_id)) : false
  end

  def self.select_puzzle(difficulty, user)
    choose_array = get_puzzles_by_diff(difficulty) - get_user_puzzles(user)
    choose_array.sample
  end


  private

  def self.get_user(id)
    User.find(id)
  end

  def self.get_user_puzzles(user)
    user.puzzle_ids
  end

  def self.get_puzzles_by_diff(difficulty)
    Puzzle.id_by_diff(difficulty)
  end

  def self.get_puzzle(id)
    Puzzle.find(id)
  end

end
