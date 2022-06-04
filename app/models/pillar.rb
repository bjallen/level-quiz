class Pillar < ApplicationRecord
    has_many :competencies
    validates :name, presence: true
end
