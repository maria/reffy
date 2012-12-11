class AddDefaultSportToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sport, :integer
  end
end
