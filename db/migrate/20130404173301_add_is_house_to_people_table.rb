class AddIsHouseToPeopleTable < ActiveRecord::Migration
  def change
    add_column :people, :is_house, :boolean, :default => false
  end
end
