# frozen_string_literal: true

class AvailabilityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    bookings = Booking.where(['cabin_id =?', record.cabin_id])
    date_ranges = bookings.map { |bk| bk.start_date..bk.end_date }

    date_ranges.each do |range|
      record.errors.add(attribute, 'date is taken') if range.include? value
    end
  end
end
