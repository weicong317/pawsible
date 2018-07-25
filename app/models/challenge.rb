class Challenge < ApplicationRecord
  has_many :uploads

  validates :category, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :point, presence: true
end
