class RemoveFbIdFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :fb_id
  end

  def down
    add_column :users, :fb_id, :integer
  end
end
