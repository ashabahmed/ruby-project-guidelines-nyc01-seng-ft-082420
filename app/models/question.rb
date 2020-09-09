class Question < ActiveRecord::Base
    has_many :game_questions
    has_many :games, through: :game_questions

    def self.hard_difficulty
        Question.all.select{|question| question.difficulty == "hard"}
    end
end