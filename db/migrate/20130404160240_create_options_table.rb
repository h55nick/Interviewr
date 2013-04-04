class CreateOptionsTable < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :answer
      t.boolean :is_correct
      t.timestamps
    end
  end

end
