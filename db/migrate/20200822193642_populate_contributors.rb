class PopulateContributors < ActiveRecord::Migration[5.2]
  def change
    Album.all.each do |album|
      Contributor.create(album_id: album.id, player_id: album.player_id)
    end
  end
end
