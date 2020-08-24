class Album < ApplicationRecord
  has_many :contributors, dependent: :destroy
  has_many :players, through: :contributors

  accepts_nested_attributes_for :contributors, allow_destroy: true

  validates :name, presence: true

  validates :contributors, presence: true
  validates_each :contributors do |record, attr, value|
    record.errors.add(:contributors, 'player_id must be unique') if value.map(&:player_id).uniq.size != value.size
  end
end
