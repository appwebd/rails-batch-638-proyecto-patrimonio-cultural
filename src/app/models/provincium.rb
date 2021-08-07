class Provincium < ApplicationRecord
  belongs_to :region

  validates :nombre, uniqueness: true, presence: true
  validates :nombre, length: { maximum: 60 }
end
