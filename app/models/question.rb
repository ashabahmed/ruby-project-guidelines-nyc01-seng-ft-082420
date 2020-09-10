class Question < ActiveRecord::Base
    has_many :game_questions
    has_many :games, through: :game_questions

    def self.hard_difficulty
        Question.all.select{|question| question.difficulty == "hard"}
    end

    def get_choice
        # binding.pry
        choice_array = [self.correct, self.wrong_one, self.wrong_two, self.wrong_three].shuffle
    end
end