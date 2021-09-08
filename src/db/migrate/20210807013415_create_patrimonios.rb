class CreatePatrimonios < ActiveRecord::Migration[6.1]
  def change
    create_table :patrimonios do |t|
      t.string :titulo
      t.string :descripcion
      t.string :ubicacion
      t.string :telefono
      t.string :email
      t.float :latitude
      t.float :longitude

      t.references :patrimonio_tipo, null:false, foreign_key: true
      t.references :user, null:false, foreign_key: true

      t.timestamps
    end
  end
end
