class User < ApplicationRecord
  include Clearance::User
  has_many :uploads

  # validates :email, format: { with: /\A\w+.?\w+@\w+.\w+\z/ }, uniqueness: true
  # validates :owner_name, presence: true
  # validates :breed, presence: true
  # validates :dog_name, presence: true
  # validates :bio, presence: true

  enum status: [:"underdog", :"good dog", :"clever dog", :"hotdog", :"top dog"]
end
