class CreatePatrimonioTipos < ActiveRecord::Migration[6.1]
  def change
    create_table :patrimonio_tipos do |t|
      t.string :nombre
      t.boolean :active

      t.timestamps
    end
  end
end
