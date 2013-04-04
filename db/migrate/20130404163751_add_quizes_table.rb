class AddQuizesTable < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.integer :person_id
      t.timestamps
    end
  end
end
