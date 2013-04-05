class AddPersonIdToQuizzesTable < ActiveRecord::Migration
  def change
    add_column :quizzes, :person_id, :integer
  end
end
