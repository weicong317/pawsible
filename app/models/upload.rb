class Upload < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  # validates :user_id, presence: true
  # validates :challenge_id, presence: true
  # validates :media, presence: true
end
