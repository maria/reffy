class AddPrivacyBoolToGames < ActiveRecord::Migration
  def change
  	change_column :games, :privacy, :boolean
  end
end
