ActiveAdmin.register Room do
  permit_params :building, :size, :room_num
  index do
    column :building
    column "Sitting Capacity", :size
    column "Room Number", :room_num

  end

end
