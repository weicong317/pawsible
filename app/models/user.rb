class User < ApplicationRecord
  include Clearance::User
  has_many :uploads, dependent: :destroy

  mount_uploader :profile_pic, AvatarUploader

  validates :email, format: { with: /\A\w+.?\w+@\w+.\w+\z/ }, uniqueness: true

  enum status: [:"underdog", :"gooddog", :"cleverdog", :"hotdog", :"topdog"]

  def completeChallenge?(challengeId)
    self.uploads.each do |row|
      if row.challenge_id === challengeId
        return true
      end
    end
    return false
  end

  def completeAllChallenge?(challengeId)
    temp = []
    self.uploads.each do |row|
      temp << row.challenge_id
    end
    if temp.include?(challengeId)
      return true
    end
    return false
  end

  def badge
    case total_points
    when 0..100
      "004-underdog.png"
    when 101..200
      "003-gooddog.png"
    when 201..300
      "002-cleverdog.png"
    when 301..400
      "001-hotdog.png"
    else
      "005-topdog.png"
    end
  end
end