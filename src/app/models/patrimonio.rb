class Patrimonio < ApplicationRecord
  belongs_to :patrimonio_tipo
  belongs_to :user
  has_one_attached :photo

  geocoded_by :ubicacion

  validates :titulo, presence: true

  validates :descripcion, presence: true

  validates :ubicacion, presence: true
  validates :ubicacion, length: { maximum: 250 }

  validates :telefono, uniqueness: true, presence: true
  validates :telefono, length: { maximum: 15 }

  validates :email, uniqueness: true, presence: true
  validates :email, length: { maximum: 254 }

end
