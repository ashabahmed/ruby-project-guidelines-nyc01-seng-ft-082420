require_relative '../config/environment'

require 'pry'

#User.destroy_all
#Question.destroy_all
#Game.destroy_all
#GameQuestion.destroy_all

testing_game_questions = GameQuestion.create(game_id:2, question_id: 3, correct: true)
joe = User.new(username: "Joe")
joe.save

game1 = Game.create(user_id:1, difficulty: "medium")
test_question = Question.create(question: "four five or six?", difficulty: "easy")


joe = User.new(username: "Joe")
joe.save

