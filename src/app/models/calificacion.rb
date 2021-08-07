class Calificacion < ApplicationRecord
  belongs_to :patrimonio

  validates :descripcion, presence: true
  validates :fecha, presence: true
  validates :ranking, presence: true
  validates :ranking, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
