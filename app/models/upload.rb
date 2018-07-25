class Upload < ApplicationRecord
  belongs_to :pet
  belongs_to :challenge

  validates :pet_id, presence: true
  validates :challenge_id, presence: true
  validates :video, presence: true
end
