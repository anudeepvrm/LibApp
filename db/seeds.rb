room=Room.create!(roomno: '1234', building: 'hunt', size: '2')
Room.create!(roomno: '1231', building: 'hunt', size: '2')
Room.create!(roomno: '1230', building: 'hunt', size: '2')
Room.create!(roomno: '1235', building: 'hunt', size: '4')

Bookedroom.create!(user_id: 2,room_id:room.roomno, status: 'booked', booking_time: "29/Nov/2016 12:00:00".to_datetime.in_time_zone('UTC'))

#Bookedroom.create!(user_id: 2,room_id:room.roomno, status: 'booked', booking_time: DateTime.now.in_time_zone('UTC'))
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
