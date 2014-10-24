class Team < ActiveRecord::Base

  has_many :rosters
  has_many :users, :through => :rosters
  has_many :invitations
  has_many :tasks
  has_many :notes

  validates_presence_of :name
end


