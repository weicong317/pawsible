class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.belongs_to :user, index: true
      t.string :dog_name
      t.string :breed
      t.text :biography
      t.json :profile_pic
      t.integer :status
      t.integer :total_points
      t.timestamps
    end
  end
end
