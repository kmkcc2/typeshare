class DeleteLikesFromTweets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :likes
  end
end
