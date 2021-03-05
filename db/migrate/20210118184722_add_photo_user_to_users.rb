class AddPhotoUserToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photoUser, :text
  end
end
