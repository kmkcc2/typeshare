class ChangeColumnNameTweets < ActiveRecord::Migration[7.0]
  def change
    rename_column :tweets, :owner, :user_id
  end
end
