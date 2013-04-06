class AddPeopleTable < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :password_digest
      t.string :phone
      t.text :image_file
      t.float :balance
      t.float :lat
      t.float :long
      t.string :customer_id
      t.timestamps
    end
  end
end

