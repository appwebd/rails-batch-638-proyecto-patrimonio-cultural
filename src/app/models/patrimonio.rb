class Patrimonio < ApplicationRecord
  belongs_to :patrimonio_tipo
  geocoded_by :ubicacion

  validates :titulo, presence: true, length: { minimum: 15 }

  validates :descripcion, presence: true

  validates :ubicacion, presence: true
  validates :ubicacion, length: { maximum: 200 }

  validates :telefono, uniqueness: true, presence: true
  validates :telefono, length: { maximum: 15 }

  validates :email, uniqueness: true, presence: true
  validates :email, length: { maximum: 254 }

  after_validation :geocode #, if: :will_save_change_to_address?

end
