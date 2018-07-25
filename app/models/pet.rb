class Pet < ApplicationRecord
  belongs_to :user
  has_many :uploads

  validates :user_id, presence: true
  validates :dog_name, presence: true
  validates :breed, presence: true
end
