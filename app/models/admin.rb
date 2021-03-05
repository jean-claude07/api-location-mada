class Admin < ApplicationRecord
    has_secure_password
    mount_uploader :adminphoto, AdminphotoUploader
    has_many :publications
    has_many :commentaires
end
