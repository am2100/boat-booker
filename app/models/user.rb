class User < ActiveRecord::Base
  attr_accessible :name

  has_many :bookings

  validates :name, presence: true
end
