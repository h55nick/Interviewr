class AddExerciseIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :exercise_id, :integer
  end
end
