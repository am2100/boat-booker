class Booking < ActiveRecord::Base
  attr_accessible :book_from, :book_to

  belongs_to :user

  validates :book_from, :book_to, presence: true
end
