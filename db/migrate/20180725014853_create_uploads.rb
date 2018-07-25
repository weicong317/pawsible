class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.belongs_to :pet, index: true
      t.belongs_to :challenge, index: true
      t.json :video
      t.boolean :verification
      t.integer :number_of_rating
      t.timestamps
    end
  end
end
