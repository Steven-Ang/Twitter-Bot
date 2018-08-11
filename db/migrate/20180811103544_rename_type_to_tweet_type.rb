class RenameTypeToTweetType < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :type, :tweet_type
  end
end
