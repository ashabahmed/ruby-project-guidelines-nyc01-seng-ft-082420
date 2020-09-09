require_relative '../config/environment'

require 'pry'

User.destroy_all
Question.destroy_all
Game.destroy_all
GameQuestion.destroy_all



joe = User.new(username: "Joe")
joe.save

game1 = Game.create(user_id: joe.id, difficulty: "medium")
test_question = Question.create(question: "four five or six?", difficulty: "easy", correct: "juice", wrong_one: "wrong", wrong_two: "wrong again", wrong_three: "WRONG!!")

testing_game_questions = GameQuestion.create(game_id: game1.id, question_id: test_question.id, correct: true)

# response = (JSON)
# response = {}
# response.results.each do |qapi|
#     Question.create(question: qapi.question, difficulty: qapi.difficulty, correct: qapi.correct_answer, wrong_one: qapi.incorrect_answers[0], wrong_two: qapi.incorrect_answers[1], wrong_three: qapi.incorrect_answers[2])

# end
binding.pry
