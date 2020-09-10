class User < ActiveRecord::Base
    has_many :games
    # def delete_user
    #     self.drop
    # end
    def starting_points
        self.points = 100
    end

    def add_points
        self.increment(:points, 100)
    end
end