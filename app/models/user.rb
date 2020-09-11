class User < ActiveRecord::Base
    has_many :games
    
    def delete_user
        self.destroy
    end
    
    def add_points
        self.increment(:points, 100)
        self.save
    end
end