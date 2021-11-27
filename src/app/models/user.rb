class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :validatable, :recoverable

  has_many :patrimonios, dependent: :destroy
  has_many :users, dependent: :destroy

  has_one_attached :photo

  validates :nombre, presence: true
  validates :apellidos, presence: true

  def admin?
    user.tipo_usuario == 1
  rescue StandardError
    false
  end

  def self.get_nombre_apellidos(id)
    user = User.find(id)
    "#{user.nombre} #{user.apellidos}"
  end
end
