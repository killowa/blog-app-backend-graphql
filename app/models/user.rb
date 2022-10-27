class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  def auth_token
    JsonWebToken.encode({user_id: id})
  end

  def admin?
    role == "admin"
  end
end
