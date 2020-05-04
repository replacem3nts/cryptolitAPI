class CreatePuzzles < ActiveRecord::Migration[6.0]
  def change
    create_table :puzzles do |t|
      t.text :content
      t.string :author
      t.string :source
      t.integer :difficulty

      t.timestamps
    end
  end
end
