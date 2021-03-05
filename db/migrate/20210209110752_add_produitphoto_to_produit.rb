class AddProduitphotoToProduit < ActiveRecord::Migration[6.0]
  def change
    add_column :produits, :produitphoto, :text
  end
end
