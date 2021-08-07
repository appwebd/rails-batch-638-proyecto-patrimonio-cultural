class PatrimonioTipo < ApplicationRecord
  has_many :patrimonio, dependent: :destroy

  validates :nombre, uniqueness: true, presence: true
  validates :nombre, length: { maximum: 60 }
end
