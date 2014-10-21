class CaredObject < ActiveRecord::Base
  has_many :tasks
  has_many :notes
  has_one :team
end
