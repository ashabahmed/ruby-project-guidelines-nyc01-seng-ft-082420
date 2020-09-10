require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-color'
require 'tty-box'


class GameApp
    attr_reader :user

    def run
        welcome
        login
        select_difficulty
    end

    def welcome
        puts "Sooo...YOU THINK YOU KNOW MOVIES?!"
        sleep(2)
        puts "Welcome!"
    end

    def login
        puts "Enter Username: "
        input = gets.chomp.to_s
        @user = User.find_or_create_by(username: input)
        
    end

    def select_difficulty
        prompt = TTY::Prompt.new
        level = %w(Easy Medium Hard)
        user_difficulty = prompt.select("Please select a level of Difficulty:", level)
        if user_difficulty == "Easy"
            easy_questions
        elsif user_difficulty == "Medium"
            medium_questions
        else
            correct = 0
           @game = Game.create(:user_id => @user.id, :difficulty => user_difficulty)

            hard_questions.each do |question|
                GameQuestion.create(:game_id => @game.id, :question_id => question.id)
            end
            # binding.pry
            @game.questions.each do |question|
                qp = TTY::Prompt.new
                response = qp.select(question.question, question.get_choice)
                if response == question.correct
                    correct += 1
                    # find a way to update the @game gamequstions that particular one. once you find it, you need to do something like @gamequetion.correct = true then @gamequestion.save
                end
                puts "you have #{correct}/#{@game.questions.count} correct"
            end

            play_again = prompt.select("Would you like to play again?", ["Yes", "No"])
            if play_again == "Yes"
                select_difficulty
            else
                puts "Thanks for playing"
            end

        end
    end
    
    def play_game(game)
        question_count = 0
        while question_count < 5
            puts Question.hard_difficulty[0].question
        end
    end
    
    def easy_questions
        puts "This is Easy".colorize(:green)
    end

    def medium_questions
        puts "This is Medium".colorize(:light_yellow)
    end

    # def hard_questions
    #    puts "This is HARD".colorize(:red)
    #    puts Question.hard_difficulty.shuffle.first.question
    # end
    def hard_questions
        Question.hard_difficulty.shuffle[0..4]
    end


    # def questions(difficulty, question, answers)
    #     choices = %w(answers)
    #     prompt.multi_select(question, answers)
    #     if correct
    #         "Correct!"
    #     else
    #         "=("
    #     end
    # end
    # def play_again
    #     prompt.yes?("Would you like to play again?")
    #     if yes

    #         select_difficulty
    #     else
    #         "Thank you for playing"
    #     end
    # end
end