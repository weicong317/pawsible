class User < ApplicationRecord
  include Clearance::User
  has_one :pet

  validates :email, format: { with: /\A\w+.?\w+@\w+.com\z/ }
  validates :name, presence: true
end
