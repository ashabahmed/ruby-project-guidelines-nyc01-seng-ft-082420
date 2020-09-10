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
        box = TTY::Box.frame "Welcome to", "YOU THINK YOU KNOW MOVIES?!", padding: 3, align: :center, border: :thick
        puts box.colorize(:magenta)
    end

    def login
        puts "Enter Username: ".colorize(:yellow)
        input = gets.chomp
        @user = User.find_or_create_by(username: input)
        # @user.points = 0
    end

    def select_difficulty
        prompt = TTY::Prompt.new
        level = %w(Easy Medium Hard)
        user_difficulty = prompt.select("Please select a level of Difficulty:", level)
        if user_difficulty == "Easy"
            @game = Game.create(:user_id => @user.id, :difficulty => user_difficulty)
            easy_questions
            questions_and_choices
        elsif user_difficulty == "Medium"
            @game = Game.create(:user_id => @user.id, :difficulty => user_difficulty)
            medium_questions
            questions_and_choices
        else
            @game = Game.create(:user_id => @user.id, :difficulty => user_difficulty)
            hard_questions
            questions_and_choices
        end
        play_again?
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
                # if @user.points == nil 
                #     @user.starting_points
                # else
                #     @user.add_points
                # end
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
        end
    end
end
# find a way to update the @game gamequstions that particular one. once you find it, you need to do something like @gamequetion.correct = true then @gamequestion.save
