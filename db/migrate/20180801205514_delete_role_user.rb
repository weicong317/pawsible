class DeleteRoleUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :role, :integer
  end
end