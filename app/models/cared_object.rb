class CaredObject < ActiveRecord::Base
  has_many :tasks
  has_many :notes
  has_one :team
  has_many :users, :through => :team

  validates_presence_of :name
end
