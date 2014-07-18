module ApplicationHelper
  def boat_booker_date(date)
    p date.class
    date.strftime("%d/%m/%Y")
  end

  def boat_booker_time(time)
    time.strftime("%H:%M")
  end
end
