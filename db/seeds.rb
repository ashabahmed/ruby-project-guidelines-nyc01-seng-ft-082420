require_relative '../config/environment'

require 'pry'

User.destroy_all
Question.destroy_all
Game.destroy_all
GameQuestion.destroy_all



joe = User.new(username: "Joe")
joe.save

game1 = Game.create(user_id: joe.id, difficulty: "medium")
test_question1 = Question.create(question: "four five or six?", difficulty: "easy", correct: "juice", wrong_one: "wrong", wrong_two: "wrong again", wrong_three: "WRONG!!")
q1 = Question.create(question: "In the 1984 movie 'The Terminator', what model number is the Terminator portrayed by Arnold Schwarzenegger?", difficulty: "medium", correct: "T-800", wrong_one: "I-950", wrong_two: "T-888", wrong_three: "T-1000")
q2 = Question.create(question: "Which 1994 film did Roger Ebert famously despise, saying 'I hated hated hated hated hated this movie'", difficulty: "hard", correct: "North", wrong_one: "3 Ninjas Kick Back", wrong_two: "The Santa Clause", wrong_three: "Richie Rich")
q3 = Question.create(question: "In Big Hero 6, what fictional city is the Big Hero 6 from?", difficulty: "easy", correct: "San Fransokyo", wrong_one: "San Tokyo", wrong_two: "Sankyo", wrong_three: "Tokysisco")
q4 = Question.create(question: "Which 90's comedy cult classic features cameos appearances from Meat Loaf, Alice Cooper and Chris Farley?", difficulty: "medium", correct: "Wayne's World", wrong_one: "Bill & Ted's Excellent Adventure", wrong_two: "Dumb and Dumber", wrong_three: "Austin Powers: International Man of Mystery")
q5 = Question.create(question: "Which sci-fi cult films plot concerns aliens attempting to prevent humans from creating a doomsday weapon?", difficulty: "hard", correct: "Plan 9 from Outer Space", wrong_one: "The Man from Planet X", wrong_two: "It Came from Outer Space", wrong_three: "The Day The Earth Stood Still")
testing_game_questions = GameQuestion.create(game_id: game1.id, question_id: test_question1.id, correct: true)

# response = (JSON)
# response = {}
# response.results.each do |qapi|
#     Question.create(question: qapi.question, difficulty: qapi.difficulty, correct: qapi.correct_answer, wrong_one: qapi.incorrect_answers[0], wrong_two: qapi.incorrect_answers[1], wrong_three: qapi.incorrect_answers[2])

# end
binding.pry
