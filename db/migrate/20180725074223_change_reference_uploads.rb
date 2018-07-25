class ChangeReferenceUploads < ActiveRecord::Migration[5.2]
  def change
    remove_belongs_to :uploads, :pet

    add_belongs_to :uploads, :user
  end
end
