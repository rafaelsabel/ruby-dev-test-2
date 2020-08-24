class CreateContributors < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors do |t|
      t.references :album, null: false, index: true#, foreign_key: true
      t.references :player, null: false, index: true#, foreign_key: true
      t.index [:album_id, :player_id], unique: true
    end
  end
end
