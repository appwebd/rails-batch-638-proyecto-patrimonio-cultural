class Comuna < ApplicationRecord
  belongs_to :prov

  validates :nombre, uniqueness: true, presence: true
  validates :nombre, length: { maximum: 60 }
end
