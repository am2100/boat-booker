require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe 'boat_booker_date' do
    it 'returns a properly formated date' do
      date = DateTime.new(2014, 7, 29)
      expect(boat_booker_date(date)).to eq('29/07/2014')
    end
  end

  describe 'boat_booker_time' do
    it 'returns a properly formated time' do
      time = DateTime.new(2014, 7, 29, 10)
      expect(boat_booker_time(time)).to eq('10:00')
    end
  end
end

