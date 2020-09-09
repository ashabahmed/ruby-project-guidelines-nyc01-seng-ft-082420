require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-color'
require 'tty-box'

prompt = TTY::Prompt.new

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
        selection = prompt.select("Please select a level of Difficulty:", level)
        if selection == "Easy"
            easy_questions
        elsif selection == "Medium"
            medium_questions
        else
            hard_questions
        end
    end

    def easy_questions
        puts "This is Easy".colorize(:green)

    end

    def medium_questions
        puts "This is Medium".colorize(:light_yellow)
    end

    def hard_questions
       puts "This is HARD".colorize(:red)
       puts Question.hard_difficulty[0].question
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