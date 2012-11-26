class AddPrivacyToGames < ActiveRecord::Migration
  def change
  	add_column :games, :privacy, :boolean
  	add_column :teams, :open, :boolean
  end
end
