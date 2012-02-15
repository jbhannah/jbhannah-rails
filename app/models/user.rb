class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :remember_me

  has_many :posts

  def to_s
    Settings.name if self == User.first
  end
end
