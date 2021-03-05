class Location < ApplicationRecord
    belongs_to :user
    # mount_uploader :locationphoto, LocationphotoUploader
end
