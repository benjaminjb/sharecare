class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rosters
  has_many :teams, :through => :rosters
  has_many :tasks, :through => :teams
  has_many :notes, :through => :teams
  has_many :claims

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  # Settings through Ledermann rails-setting gem
  has_settings do |s|
    s.key :presentation, :defaults => { :alert_style => 'sweet', :alert_length => 2500 }
    s.key :time_zone, :defaults => { :local_time => 'Central Time (US & Canada)'}
  end

  # Removed because invitations are no longer indexed to users' id
  # Potentially re-add as indexed to users' email
  # has_many :invitations
end



