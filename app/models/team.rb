class Team < ActiveRecord::Base
  has_many :users
  has_one :cared_object
  has_many :tasks, through: :cared_object
  has_many :notes, through: :cared_object
  has_many :invitations
end
