room=Room.create!(roomno: '1234', building: 'hunt', size: '2')


Bookedroom.create!(user_id: 2,room_id:room.roomno, status: 'booked', booking_time: "29/Nov/2016 12:00:00".to_datetime.in_time_zone('UTC'))