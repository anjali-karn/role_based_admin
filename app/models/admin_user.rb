class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
  enum role: { subadmin: 'subadmin', superadmin: 'superadmin' }
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end
