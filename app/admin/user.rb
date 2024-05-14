# app/admin/user.rb

ActiveAdmin.register User do
    permit_params :email, :password
  
    form do |f|
      f.inputs "User Details" do
        f.input :email
        f.input :password
      f.actions
    end
end
end