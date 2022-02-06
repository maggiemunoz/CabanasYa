module BookingsHelper
    def is_taken(date, cabin, bookings)
        bookings.each do |booking|
            if date >= booking.start and date <= booking.end
                return true
            end 
        end
        return false
    end       
end
