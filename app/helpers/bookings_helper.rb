# frozen_string_literal: true

module BookingsHelper
  def nearest_date(cabin, bookings)
    date = Date.today
    
    date
  end

  def taken?(date, _cabin, bookings)
    puts date
    bookings.each do |booking|
      return true if (date >= booking.start_date) && (date <= booking.end_date)
    end
    false
  end
end
