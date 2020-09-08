class CreateQuestionsTable < ActiveRecord::Migration[6.0]
    def change
        create_table :questions do |t|
            t.string :question
            t.string :difficulty
            t.string :correct
            t.string :wrong_one
            t.string :wrong_two
            t.string :wrong_three
        end
    end
end