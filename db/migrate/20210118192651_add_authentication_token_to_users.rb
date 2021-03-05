class AddAuthenticationTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :authentication_token, :text, limit: 2021
    add_index :users, :authentication_token, unique: true
  end
end
