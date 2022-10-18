class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :tweet_id
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end
end
