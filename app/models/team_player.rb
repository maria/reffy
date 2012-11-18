class TeamPlayer < ActiveRecord::Base
  attr_accessible :team_id, :user_id

  belongs_to :team
  belongs_to :user

  validates :user_id , :presence =>true
  validates :team_id, :presence =>true
					
end
