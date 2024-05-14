ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role
  
  controller do
    def update
      if current_admin_user.role == 'superadmin'
        super
      else
        # Agar current user superadmin nahi hai, toh role ko update nahi karne dena
        params[:admin_user].delete(:role)
        super
      end
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      if current_admin_user.role == 'superadmin'
        f.input :role, as: :select, collection: ['superadmin', 'subadmin']
        f.input :password
        f.input :password_confirmation
      else
        f.input :role, input_html: { disabled: true }
      end
    end
    if current_admin_user.role == 'superadmin'
      f.actions
    else
      f.actions do
        f.action :submit, label: 'Read Only', button_html: { disabled: true }
      end
    end
  end
end
