room=Room.create!(roomno: '1234', building: 'hunt', size: '2')


#Bookedroom.create!(user_id: 2,room_id:room.roomno, status: 'booked', booking_time: DateTime.now.in_time_zone('UTC'))
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')