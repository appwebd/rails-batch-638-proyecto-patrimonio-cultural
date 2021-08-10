class Prov < ApplicationRecord
  belongs_to :region
  has_many :comunas, dependent: :destroy

  validates :nombre, uniqueness: true, presence: true
  validates :nombre, length: { maximum: 60 }
end
