# frozen_string_literal: true

module BookingsHelper
  def nearest_date(cabin)
    date = Date.today
    date += 1.days while taken?(date, cabin)
    date
  end

  def taken?(date, _cabin)
    Booking.all.each do |booking|
      return true if (date >= booking.start_date.to_date) & (date <= booking.end_date.to_date)
    end
    false
  end
end
