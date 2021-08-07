class CreateProvincia < ActiveRecord::Migration[6.1]
  def change
    create_table :provincia do |t|
      t.string :nombre
      t.integer :region_id

      t.references :region, null:false, foreign_key: true
      t.timestamps
    end
  end
end
