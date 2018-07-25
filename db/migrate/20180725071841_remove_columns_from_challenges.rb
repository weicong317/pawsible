class RemoveColumnsFromChallenges < ActiveRecord::Migration[5.2]
  def change
  	remove_column(:challenges, :difficulty)
  	remove_column(:challenges, :category)
  end
end