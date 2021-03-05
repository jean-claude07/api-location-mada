class AddAdminphotoToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :adminphoto, :text
  end
end
