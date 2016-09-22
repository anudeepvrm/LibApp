json.extract! bookedroom, :id, :roomno, :building, :size, :status, :created_at, :updated_at
json.url bookedroom_url(bookedroom, format: :json)