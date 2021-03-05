class Commentaire < ApplicationRecord
    belongs_to :admin
    belongs_to :publication
end
