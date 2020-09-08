class CreateGamesTable < ActiveRecord::Migration[6.0]
    def change
        create_table :games do |t|
            t.integer :user_id
            t.string :difficulty
        end
    end
end