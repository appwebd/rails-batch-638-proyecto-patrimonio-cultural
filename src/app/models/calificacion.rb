class Calificacion < ApplicationRecord
  belongs_to :patrimonio
  belongs_to :user

  validates :descripcion, presence: true
  validates :fecha, presence: true
  validates :ranking, presence: true
  validates :ranking, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def self.get_rating_media(id)
    sql = "SELECT avg(ranking) FROM calificacions WHERE patrimonio_id = #{id}"
    array = ActiveRecord::Base.connection.exec_query(sql)
    if array[0]['avg'].nil?
      0
    else
      array[0]['avg']
    end
  end

  def self.get_date
    sql = "select current_date;"
    array = ActiveRecord::Base.connection.exec_query(sql)
    if array[0]['current_date'].nil?
      0
    else
      array[0]['current_date']
    end
  end
end
