class Challenge < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :puzzle

  before_create :add_crypto_and_key

  private

  def add_crypto_and_key
    self.cryptogram = Cipher.level_one_crypto(self.puzzle.content, self.puzzle.difficulty)
    self.solvekey = Cipher.level_one_key(self.puzzle.content)
  end

end
