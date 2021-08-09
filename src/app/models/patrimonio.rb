class Patrimonio < ApplicationRecord
  belongs_to :patrimonio_tipo

  validates :descripcion, presence: true

  validates :ubicacion, presence: true
  validates :ubicacion, length: { maximum: 200 }

  validates :telefono, uniqueness: true, presence: true
  validates :telefono, length: { maximum: 15 }

  validates :email, uniqueness: true, presence: true
  validates :email, length: { maximum: 254 }
   
  validates :geo_ref_latitud, :decimal, {:precision=>10, :scale=>6}
  validates :geo_ref_longitud, :decimal, {:precision=>10, :scale=>6}
end
