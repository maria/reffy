class User < ActiveRecord::Base
  attr_accessible :city, :initial, :name, :fb_id, :team_id, :sport_id
  email_regex = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
  has_and_belongs_to_many :teams, foreign_key: 'user_id'
  has_and_belongs_to_many :sports, foreign_key: 'id'
  
  has_many :teamplayers, through: :teams
  validates :name, :presence => true,
				   :lenght   => { :maximum => 50,
								  :minimum => 3}

  validates :email,:presence => true,
					 :format   => { :with => email_regex},
					 :uniqueness =>{  :case_sensitive => false}
  validates :city, :length => { :maximum => 20}
  validates :fb_id, :uniqueness => true,
					:presence => true
  
end
