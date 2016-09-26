ActiveAdmin.register Room do

  permit_params :roomno, :building, :size, :status,:date
  index do
    column "Room Number",:roomno
    column :building
    column :status
    column :size
    actions
  end

  show do
    attributes_table do
      row :roomno
      row :building
      row :status
      row :size
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :roomno, label: 'Room Number', :as  => :number, :min => 1
      f.input :building, label: 'Building', :as => :select, :collection => ["James.B.Hunt","D.H.Hill"], include_blank: false
      f.input :size, label: 'Size', :as  => :select, :collection => [4,6,12], include_blank: false
      f.input :status, label: 'Status', :as => :select, :collection => ["Booked","Available"], include_blank: false
    end
    f.actions
  end


end
