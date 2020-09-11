class User < ActiveRecord::Base
    has_many :games
    
    def delete_user
        puts "Sorry to see you go! =(".colorize(:red)
        sleep(2)
        self.destroy
    end

    def add_points(difficulty)
        if difficulty == "easy" 
            self.increment(:points, 100)
        elsif difficulty == "medium"
            self.increment(:points, 200)
        else
            self.increment(:points, 200)
        end
        self.save
    end
end