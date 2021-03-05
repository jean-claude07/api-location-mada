class User < ApplicationRecord
    acts_as_token_authenticatable
    has_secure_password
    has_many :locations
    mount_uploader :photoUser, PhotoUserUploader
end
