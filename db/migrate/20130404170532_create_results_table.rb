class CreateResultsTable < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :person_id
      t.integer :quiz_id
      t.float :score
      t.timestamps
    end
  end
end
