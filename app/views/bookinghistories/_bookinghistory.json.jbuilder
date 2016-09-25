json.extract! bookinghistory, :id, :created_at, :updated_at
json.url bookinghistory_url(bookinghistory, format: :json)