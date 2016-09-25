ActiveAdmin.register User do

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
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
