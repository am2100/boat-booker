class Booking < ActiveRecord::Base
  attr_accessible :from, :to

  validates :from, :to, presence: true
end
