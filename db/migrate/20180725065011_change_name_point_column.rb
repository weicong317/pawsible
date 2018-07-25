class ChangeNamePointColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column(:challenges, :point, :points)
  end
end
