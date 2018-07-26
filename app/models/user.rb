class User < ApplicationRecord
  include Clearance::User
  has_many :uploads

  mount_uploader :profile_pic, AvatarUploader

  # validates :email, format: { with: /\A\w+.?\w+@\w+.\w+\z/ }, uniqueness: true
  # validates :owner_name, presence: true
  # validates :breed, presence: true
  # validates :dog_name, presence: true
  # validates :bio, presence: true

  enum status: [:"underdog", :"gooddog", :"cleverdog", :"hotdog", :"topdog"]

  def badge
    case total_points
    when 0..20
      "004-underdog.png"
    when 21..40
      "003-gooddog.png"
    when 41..60
      "002-cleverdog.png"
    when 61..80
      "001-hotdog.png"
    else
      "005-topdog.png"
    end
  end
end