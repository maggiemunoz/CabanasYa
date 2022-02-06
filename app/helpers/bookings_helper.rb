# frozen_string_literal: true

module BookingsHelper
  def nearest_date(cabin)
    date = Date.today
    date += 1.days while taken?(date, cabin)
    date
  end

  def taken?(date, cabin)
    Booking.all.each do |booking|
      next unless booking.cabin_id.to_i == cabin.id.to_i

      return true if (date >= booking.start_date.to_date) & (date <= booking.end_date.to_date)
    end
    false
  end

  def disabled_dates(cabin)
    today = Date.today - 1.days
    today = today.strftime('%F')
    dates = [
      { from: '2022-01-01', to: today }
    ]
    Booking.all.each do |booking|
      next unless booking.cabin_id.to_i == cabin.to_i

      range_start = booking.start_date.strftime('%F')
      range_end = booking.end_date.strftime('%F')
      range = { from: range_start, to: range_end }
      dates << range
    end

    puts dates
    dates
  end
end
