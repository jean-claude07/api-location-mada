class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :nomMvola
      t.string :nombre
      t.string :numero
      t.string :nomProduit
      t.string :cout
      t.string :payment
      t.belongs_to :user
      t.string :image
      t.date :date

      t.timestamps
    end
  end
end
