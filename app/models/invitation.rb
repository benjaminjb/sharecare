class Invitation < ActiveRecord::Base
  belongs_to :team
  # belongs_to :user

  validates_format_of :email, :with => /@/
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
