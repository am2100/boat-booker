require 'date'

class Booking < ActiveRecord::Base
  attr_accessible :book_from, :book_to

  belongs_to :user

  validates :book_from, :book_to, presence: true

  BOAT_SEASON = %w{ Mar Apr May Jun Jul Aug Sep Oct }

  def self.month_options
    options = []
    BOAT_SEASON.each {|month| options << [ month, Date::ABBR_MONTHNAMES.index(month) ]}
    return options
  end

end
