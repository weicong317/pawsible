class ChangeNameNameColumn < ActiveRecord::Migration[5.2]
  def change
  	 	rename_column(:users, :name, :owner_name)
  end
end
