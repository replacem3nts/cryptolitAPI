class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :puzzle, null: false, foreign_key: true
      t.boolean :solved, default: false
      t.integer :solvetime, default: 0
      t.timestamps
    end
  end
end
