json.extract! booking, :id, :start, :end, :created_at, :updated_at
json.url booking_url(booking, format: :json)