class PatrimonioTipo < ApplicationRecord
  validates :nombre, uniqueness: true, presence: true
  validates :nombre, length: { maximum: 60 }
end
