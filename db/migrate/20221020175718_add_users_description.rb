class AddUsersDescription < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :talk, :intiger
    add_column :users, :relation, :intiger
    add_column :users, :netflix, :intiger
    add_column :users, :games, :intiger
    add_column :users, :adventure, :intiger
    add_column :users, :job, :string
    add_column :users, :links, :string
  end
end
