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
        box = TTY::Box.frame "Welcome to", "Soooo..", "YOU THINK YOU KNOW MOVIES?!", padding: 3, align: :center
        puts box.colorize(:light_red).on_blue.underline
        # puts "Sooo...YOU THINK YOU KNOW MOVIES?!"
        # sleep(3)
        # puts "Welcome!"
    end

    def login
        String.colors
        binding.pry
        puts "Enter Username: ".colorize(:yellow)
        input = gets.chomp.to_s
        @user = User.find_or_create_by(username: input)
    end

    def select_difficulty
        prompt = TTY::Prompt.new
        level = %w(Easy Medium Hard)
        user_difficulty = prompt.select("Please select a level of Difficulty:", level)
        if user_difficulty == "Easy"
            puts "This is Easy".colorize(:green)
            sleep (3)
            correct = 0
            # start_game
            @game = Game.create(:user_id => @user.id, :difficulty => user_difficulty)
            easy_questions
            # easy_questions.each do |question|
            #     GameQuestion.create(:game_id => @game.id, :question_id => question.id)
            # end
            @game.questions.each do |question|
                qp = TTY::Prompt.new
                response = qp.select(question.question, question.get_choice)
                if response == question.correct
                    correct += 1
                    # find a way to update the @game gamequstions that particular one. once you find it, you need to do something like @gamequetion.correct = true then @gamequestion.save
                end
                puts "You have #{correct}/#{@game.questions.count} correct".colorize(:blue)
            end

            play_again = prompt.select("Would you like to play again?", ["Yes", "No"])
            if play_again == "Yes"
                select_difficulty
            else
                puts "Thanks for playing"
            end
        elsif user_difficulty == "Medium"
            puts "This is Medium".colorize(:light_yellow)
            sleep (3)
            correct = 0
            start_game 
            medium_questions
            # medium_questions.each do |question|
            #     GameQuestion.create(:game_id => @game.id, :question_id => question.id)
            # end
            @game.questions.each do |question|
                qp = TTY::Prompt.new
                response = qp.select(question.question, question.get_choice)
                if response == question.correct
                    correct += 1
                    # find a way to update the @game gamequstions that particular one. once you find it, you need to do something like @gamequetion.correct = true then @gamequestion.save
                end
                puts "You have #{correct}/#{@game.questions.count} correct".colorize(:blue)
            end

            play_again = prompt.select("Would you like to play again?", ["Yes", "No"])
            if play_again == "Yes"
                select_difficulty
            else
                puts "Thanks for playing"
            end
        else
            puts "This is HARD!!".colorize(:red)
            sleep (3)
            correct = 0
            start_game 
            hard_questions
            # @game = Game.create(:user_id => @user.id, :difficulty => user_difficulty)
            # hard_questions.each do |question|
            #     GameQuestion.create(:game_id => @game.id, :question_id => question.id)
            # end
            # binding.pry
            @game.questions.each do |question|
                qp = TTY::Prompt.new
                response = qp.select(question.question, question.get_choice)
                if response == question.correct
                    correct += 1
                    # find a way to update the @game gamequstions that particular one. once you find it, you need to do something like @gamequetion.correct = true then @gamequestion.save
                end
                puts "You have #{correct}/#{@game.questions.count} correct".colorize(:blue)
            end

            play_again = prompt.select("Would you like to play again?", ["Yes", "No"])
            if play_again == "Yes"
                select_difficulty
            else
                puts "Thanks for playing"
            end

        end
    end
    
    # def start_game
    #     @game = Game.create(:user_id => @user.id, :difficulty => user_difficulty)
    # end
    
    def easy_questions
        # puts "This is Easy".colorize(:green)
        eq = Question.easy_difficulty.shuffle[0..4]
        eq.each do |question|
            GameQuestion.create(:game_id => @game.id, :question_id => question.id)
        end
    end

    def medium_questions
        # puts "This is Medium".colorize(:light_yellow)
        mq = Question.medium_difficulty.shuffle[0..4]
        mq.each do |question|
            GameQuestion.create(:game_id => @game.id, :question_id => question.id)
         end
    end

    # def hard_questions
    #    puts "This is HARD".colorize(:red)
    #    puts Question.hard_difficulty.shuffle.first.question
    # end
    def hard_questions
        # puts "This is HARD!!".colorize(:red)
        # sleep(3)
        hq = Question.hard_difficulty.shuffle[0..4]
        hq.each do |question|
            GameQuestion.create(:game_id => @game.id, :question_id => question.id)
         end
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