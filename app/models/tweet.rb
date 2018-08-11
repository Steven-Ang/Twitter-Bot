class Tweet < ApplicationRecord
  belongs_to :user
  enum tweet_type: {pending: 0, scheduled: 1, sent: 2, failed: 3, archived: 4}
end
