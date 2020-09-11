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
        main_menu
    end

    def welcome
        box = TTY::Box.frame "Welcome to", "YOU THINK YOU KNOW MOVIES?!", padding: 3, align: :center, border: :thick
        puts box.colorize(:magenta)
    end

    def login
        puts "Enter Username to login or sign-up: ".colorize(:yellow)
        input = gets.chomp
        @user = User.find_or_create_by(username: input)
        if @user.points == nil 
            @user.points = 0
            @user.save
        end
    end
    
    def main_menu
        prompt = TTY::Prompt.new
        choices = %w(Play Score Delete Exit)
        selection = prompt.select("What would you like to do?", choices)
        if selection == "Play"
            select_difficulty
        elsif selection == "Score" 
            puts "You have #{@user.points} total points!".colorize(:green)
            sleep(2)
            main_menu
        elsif selection == "Exit"
            box = TTY::Box.frame "THANKS FOR PLAYING!", "SEE YOU NEXT TIME!", padding: 3, align: :center, border: :thick
            puts box.colorize(:light_blue)
        else selection == "Delete"
            @user.delete_user
        end
    end

    def select_difficulty
        prompt = TTY::Prompt.new
        level = %w(Easy Medium Hard)
        user_difficulty = prompt.select("Please select desired difficulty:", level)
        @game = Game.create(:user_id => @user.id, :difficulty => user_difficulty)
        start_game(user_difficulty)
        play_again?
    end

    def start_game(user_difficulty)
        if user_difficulty == "Easy"
            easy_questions
            questions_and_choices
        elsif user_difficulty == "Medium"
            medium_questions
            questions_and_choices
        else
            hard_questions
            questions_and_choices
        end
    end

    def easy_questions
        puts "This is Easy:".colorize(:green)
        sleep (3)
        eq = Question.easy_difficulty.shuffle[0..4]
        eq.each do |question|
            GameQuestion.create(:game_id => @game.id, :question_id => question.id)
        end
    end

    def medium_questions
        puts "This is Medium:".colorize(:light_yellow)
        sleep (3)
        mq = Question.medium_difficulty.shuffle[0..4]
        mq.each do |question|
            GameQuestion.create(:game_id => @game.id, :question_id => question.id)
         end
    end

    def hard_questions
        puts "This is HARD!:".colorize(:red)
        sleep(3)
        hq = Question.hard_difficulty.shuffle[0..4]
        hq.each do |question|
            GameQuestion.create(:game_id => @game.id, :question_id => question.id)
         end
    end

    def questions_and_choices
        correct = 0
        @game.questions.each do |question|
            qp = TTY::Prompt.new
            response = qp.select(question.question, question.get_choice)
            if response == question.correct
                @user.add_points(@game.difficulty)
                correct += 1 
            end
            puts "You got #{correct}/#{@game.questions.count}!".colorize(:magenta)
            sleep(2)
        end
    end

    def play_again?
        box = TTY::Box.frame "THANKS FOR PLAYING!", padding: 3, align: :center, border: :thick
        prompt = TTY::Prompt.new
        p_a = prompt.select("Would you like to play again?", ["Yes", "No"])
        if p_a == "Yes"
            select_difficulty
        else
            puts box.colorize(:light_blue)
            main_menu
        end
    end
end
