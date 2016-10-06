ActiveAdmin.register Bookedroom do

  permit_params :user, :room, :user_id, :room_id, :status, :booking_time, :id

  index do
    column :id
    column :booking_time
    column :room_id do |room_id|
      if room_id.present?
        room_id.room_id
      else
        status_tag('Empty')
      end
    end
    column :user_id do |user_num|
      if user_num.present?
        user_num.user_id
      else
        status_tag('Empty')
      end
    end
  end

  form do |f|
    f.inputs "Booking Details" do
      f.input :room_id, label: 'Room Number', :as => :select, :collection => Room.all.collect{|room|[room.roomno]}, include_blank: false
      f.input :user_id, label: 'User', :as => :select, :collection => User.all, include_blank: false
      f.input :status, label: 'Status', :as => :select, :collection => ["Booked","Available"], include_blank: false
      f.input :booking_time
    end
    f.actions
  end




end
