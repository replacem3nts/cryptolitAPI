class AddCryptogramAndSolvekeyToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :cryptogram, :text
    add_column :challenges, :solvekey, :string
  end
end
