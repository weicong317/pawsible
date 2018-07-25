class AddSponsorToChallenges < ActiveRecord::Migration[5.2]
  def change
  	add_column :challenges, :sponsor, :string
  end
end
