class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rosters
  has_many :teams, :through => :rosters
  has_many :invitations
  has_many :tasks, :through => :teams
  has_many :notes, :through => :teams
  has_many :claims

end



