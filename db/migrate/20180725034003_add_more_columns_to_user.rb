class AddMoreColumnsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :dog_name, :string
  	add_column :users, :breed, :string
  	add_column :users, :profile_pic, :json
  	add_column :users, :status, :integer
  	add_column :users, :total_points, :integer
  end
end
