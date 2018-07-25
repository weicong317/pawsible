class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.integer :category
      t.string :title
      t.text :description
      t.integer :difficulty
      t.integer :point
      t.timestamps
    end
  end
end
