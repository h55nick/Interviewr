class AddQuizIdToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :quiz_id, :integer
  end
end

