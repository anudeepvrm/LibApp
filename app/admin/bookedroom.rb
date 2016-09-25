ActiveAdmin.register Bookedroom do

  permit_params :user, :room, :user_id, :room_id, :status, :booking_time, :id

  index do
    column :id
    column :booking_time
    column :room_id do |room_id|
      if room_id.present?
        link_to room_id.room_id
      else
        status_tag('Empty')
      end
    end

    column :user_id do |user_num|
      if user_num.present?
        link_to user_num.user_id
      else
        status_tag('Empty')
      end
    end

  end
  

end
