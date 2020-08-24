class Player < ApplicationRecord
  has_many :contributions, class_name: Contributor.to_s
  has_many :albums, through: :contributions

  before_destroy :allow_destroy?, prepend: true

  validates :name, presence: true

  private

  def allow_destroy?
    return true if albums.blank?

    raise ActiveRecord::InvalidForeignKey.new('FOREIGN KEY constraint failed: DELETE FROM "players" WHERE "players"."id" = ?')
  end
end
