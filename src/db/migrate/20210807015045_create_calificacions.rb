class CreateCalificacions < ActiveRecord::Migration[6.1]
  def change
    create_table :calificacions do |t|
      t.integer :ranking
      t.string :descripcion
      t.date :fecha

      t.references :patrimonio, null:false, foreign_key: true
      t.references :user, null:false, foreign_key: true

      t.timestamps
    end
  end
end
