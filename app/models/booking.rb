require 'date'

class Booking < ActiveRecord::Base
  attr_accessible :book_from, :book_to, :user_id

  belongs_to :user

  validates :book_from, :book_to, presence: true

  BOAT_SEASON = %w{ Mar Apr May Jun Jul Aug Sep Oct }
  BOOKING_TIMES = (8..22).to_a

  def self.month_options
    options = []
    BOAT_SEASON.each {|month| options << [ month, Date::ABBR_MONTHNAMES.index(month) ]}
    return options
  end

  def self.day_options
    options = []
    (1..31).to_a.collect {|d| options << [ sprintf("%02d", d), d ] }
    return options
  end

  def self.from_time_options
    options = []
    BOOKING_TIMES.each {|time| options << [ Booking::pretty_time(time), time ]}
    return options.shift(BOOKING_TIMES.length - 1)
  end

  def self.to_time_options
    options = []
    BOOKING_TIMES.each {|time| options << [ Booking::pretty_time(time), time ]}
    return options.slice(1..BOOKING_TIMES.length - 1)
  end

  def self.pretty_time(time)
    sprintf("%02d:00", time)
  end
end
