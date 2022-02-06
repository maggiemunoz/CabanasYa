# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :cabin
  belongs_to :user

  validate :all_dates_are_free

  def all_dates_are_free
    bookings = Booking.where(['cabin_id =?', cabin_id])
    date_ranges = bookings.map { |bk| bk.start_date..bk.end_date }

    puts date_ranges
    puts '______________________________'
    puts start_date
    puts end_date
    puts '______________________________'

    (start_date.to_date..end_date.to_date).to_a.each do |date|
      date_ranges.each do |range|
        if range.include? date
          errors.add(:cabin_id, 'is taken during those days, please pick another one')
          return
        end
      end
    end
  end
end
