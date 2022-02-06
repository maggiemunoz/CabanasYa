class AvailabilityValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
      bookings = Booking.where(["cabin_id =?", record.cabin_id])
      date_ranges = bookings.map { |b| b.start_date..b.end_date }

  
      date_ranges.each do |range|
        if range.include? value
          record.errors.add(attribute, "date is taken")
        end
      end
    end
  end