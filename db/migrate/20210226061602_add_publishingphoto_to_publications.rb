class AddPublishingphotoToPublications < ActiveRecord::Migration[6.0]
  def change
    add_column :publications, :publishingphoto, :text
  end
end
