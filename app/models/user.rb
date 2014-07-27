class User < ActiveRecord::Base

  attr_accessible :name, :password

  has_many :bookings

  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: true
end
