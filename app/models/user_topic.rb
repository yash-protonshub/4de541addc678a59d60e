class UserTopic < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :topic, uniqueness: { scope: :user, message: "Already following" }
end
