require_relative '../config/environment'

require 'pry'

User.destroy_all
Question.destroy_all
Game.destroy_all
GameQuestion.destroy_all



joe = User.new(username: "Joe")
joe.save

game1 = Game.create(user_id: joe.id, difficulty: "medium")


q1 = Question.create(question: "In Big Hero 6, what fictional city is the Big Hero 6 from?", difficulty: "easy", correct: "San Fransokyo", wrong_one: "San Tokyo", wrong_two: "Sankyo", wrong_three: "Tokysisco")
q2 = Question.create(question: "At the end of the 2001 film 'Rat Race', whose concert do the contestants crash?", difficulty: "easy", correct: "Smash Mouth", wrong_one: "Bowling for Soup", wrong_two: "Sum 41", wrong_three: "Linkin Park")
q3 = Question.create(question: "The 2016 Disney animated film 'Moana' is based on which culture?", difficulty: "easy", correct: "Polynesian", wrong_one: "Native American", wrong_two: "Japanese", wrong_three: "Nordic")
q4 = Question.create(question: "In the 1995 film 'Balto', who are Steele's accomplices?", difficulty: "easy", correct: "Kaltag, Nikki, and Star", wrong_one: "Dusty, Kirby, and Ralph", wrong_two: "Nuk, Yak, and Sumac", wrong_three: "Lucky, Ned, Dusty")
q5 = Question.create(question: "Which director directed the 'Kill Bill' movies?", difficulty: "easy", correct: "Quentin Tarantino", wrong_one: "Arnold Schwarzenegger", wrong_two: "David Lean", wrong_three: "Stanley Kubrick")


q6 = Question.create(question: "In the 1984 movie 'The Terminator', what model number is the Terminator portrayed by Arnold Schwarzenegger?", difficulty: "medium", correct: "T-800", wrong_one: "I-950", wrong_two: "T-888", wrong_three: "T-1000")
q7 = Question.create(question: "Which 90's comedy cult classic features cameos appearances from Meat Loaf, Alice Cooper and Chris Farley?", difficulty: "medium", correct: "Wayne's World", wrong_one: "Bill & Ted's Excellent Adventure", wrong_two: "Dumb and Dumber", wrong_three: "Austin Powers: International Man of Mystery")
q8 = Question.create(question: "In which 1973 film does Yul Brynner play a robotic cowboy who malfunctions and goes on a killing spree?", difficulty: "medium", correct: "Westworld", wrong_one: "Runaway", wrong_two: "The Terminators", wrong_three: "Android")
q9 = Question.create(question: "Which one of these films are shot entirely in one-take?", difficulty: "medium", correct: "Russian Ark", wrong_one: "Good Will Hunting", wrong_two: "Birdman", wrong_three: "Schindler's List")
q10 = Question.create(question: "In Finding Nemo, what was the name of Nemo's mom", difficulty: "medium", correct: "Coral", wrong_one: "Sandy", wrong_two: "Pearl", wrong_three: "Shelly")

q11 = Question.create(question: "Which 1994 film did Roger Ebert famously despise, saying 'I hated hated hated hated hated this movie'", difficulty: "hard", correct: "North", wrong_one: "3 Ninjas Kick Back", wrong_two: "The Santa Clause", wrong_three: "Richie Rich")
q12 = Question.create(question: "Which sci-fi cult films plot concerns aliens attempting to prevent humans from creating a doomsday weapon?", difficulty: "hard", correct: "Plan 9 from Outer Space", wrong_one: "The Man from Planet X", wrong_two: "It Came from Outer Space", wrong_three: "The Day The Earth Stood Still")
q13 = Question.create(question: "In the 'Jurassic Park' universe, when did 'Jurassic Park: San Diego' begin construction?", difficulty: "hard", correct: "1985", wrong_one: "1986", wrong_two: "1988", wrong_three: "1993")
q14 = Question.create(question: "Which actors made up the trio in 'The Good, the Bad, and the Ugly'?", difficulty: "hard", correct: "Clint Eastwood, Eli Wallach, and Lee Van Cleef", wrong_one: "Sergio Leone, Ennio Morricone, and Tonino Delli Colli", wrong_two: "Yul Brynner, Steve McQueen, and Charles Bronson", wrong_three: "Aldo Giuff;, Mario Brega, and Luigi Pistilli")
q15 = Question.create(question: "What is the name of the supercomputer located in the control room in 'Jurassic Park' (1993)?", difficulty: "hard", correct: "Thinking Machines CM-5", wrong_one: "Cray X-MP", wrong_two: "Cray XK7", wrong_three: "IBM Blue Gene/Q")




# testing_game_questions = GameQuestion.create(game_id: game1.id, question_id: test_question.id, correct: true)

# response = (JSON)
# response = {}
# response.results.each do |qapi|
#     Question.create(question: qapi.question, difficulty: qapi.difficulty, correct: qapi.correct_answer, wrong_one: qapi.incorrect_answers[0], wrong_two: qapi.incorrect_answers[1], wrong_three: qapi.incorrect_answers[2])

# end
binding.pry
