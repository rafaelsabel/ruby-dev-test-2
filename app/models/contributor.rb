class Contributor < ApplicationRecord
  belongs_to :album
  belongs_to :player

  validates :album, presence: true, uniqueness: { scope: :player_id }
  validates :player, presence: true, uniqueness: { scope: :album_id }
end
