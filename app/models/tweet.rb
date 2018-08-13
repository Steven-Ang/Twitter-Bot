class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, :presence => true, length: {:minimum => 1, :maximum => 240}, :allow_blank => false

  enum tweet_type: {pending: 0, scheduled: 1, sent: 2, failed: 3, archived: 4}

  scope :scheduled, -> { where("tweet_type = ?", 1) }
  scope :sent, -> { where("tweet_type = ?", 2) }
end
