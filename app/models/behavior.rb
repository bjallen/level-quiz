class Behavior < ApplicationRecord
  belongs_to :competency
  belongs_to :level

  validates :description, presence: true
end
