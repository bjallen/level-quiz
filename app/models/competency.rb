class Competency < ApplicationRecord
  belongs_to :pillar
  validates :name, presence: true
end
