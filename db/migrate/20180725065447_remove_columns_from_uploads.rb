class RemoveColumnsFromUploads < ActiveRecord::Migration[5.2]
  def change
  	remove_column(:uploads, :verification)
  	remove_column(:uploads, :number_of_rating)
  	rename_column(:uploads, :video, :media)
  end
end
