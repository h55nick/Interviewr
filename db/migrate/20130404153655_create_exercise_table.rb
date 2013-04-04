class CreateExerciseTable < ActiveRecord::Migration
def change
  create_table :exercises do |t|
    t.text :question
    t.integer :difficulty
    t.float :rating
    t.boolean :is_public
    t.string :code
    t.float :cost
    t.timestamps
  end

end

end
