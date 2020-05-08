class Puzzle < ApplicationRecord
    has_many :challenges

    def self.id_by_diff(difficulty)
        id_array = where(difficulty: difficulty).map(&:id)
    end

    def show_answer
        {content: self.content, author: self.author, source: self.source}
    end
end
