ActiveAdmin.register User do

  permit_params :name, :email, :password
  show do
    attributes_table do
      row :id
      row :name
      row :email
    end
    active_admin_comments
  end

index do
  column :id
  column :name
  column :email
  actions
end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
    end
    f.actions
  end




end
