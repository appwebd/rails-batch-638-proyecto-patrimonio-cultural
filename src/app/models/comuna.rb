class Comuna < ApplicationRecord
  belongs_to :provincia

  validates :nombre, uniqueness: true, presence: true
  validates :nombre, length: { maximum: 60 }
end
