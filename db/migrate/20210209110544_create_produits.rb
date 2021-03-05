class CreateProduits < ActiveRecord::Migration[6.0]
  def change
    create_table :produits do |t|
      t.string :nom
      t.string :other
      t.string :groupe
      t.string :cout
      t.text :description

      t.timestamps
    end
  end
end
