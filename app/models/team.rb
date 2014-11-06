class Team < ActiveRecord::Base

  has_many :rosters, dependent: :destroy
  has_many :users, :through => :rosters
  has_many :invitations, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates_presence_of :name
end


