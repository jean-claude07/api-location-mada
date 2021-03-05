class Produit < ApplicationRecord
    mount_uploader :produitphoto, ProduitphotoUploader
end
