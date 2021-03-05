class Publication < ApplicationRecord
    mount_uploader :publishingphoto, PublishingphotoUploader
    has_many :commentaires
    has_many :like
end
