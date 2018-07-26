class User < ApplicationRecord
  include Clearance::User
  has_many :uploads

  # validates :email, format: { with: /\A\w+.?\w+@\w+.\w+\z/ }, uniqueness: true
  # validates :owner_name, presence: true
  # validates :breed, presence: true
  # validates :dog_name, presence: true
  # validates :bio, presence: true

  enum status: [:"004-underdog.png", :"003-gooddog.png", :"002-cleverdog.png", :"001-hotdog.png", :"005-topdog.png"]
end
