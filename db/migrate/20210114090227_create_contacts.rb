class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.string :subject
      t.text :message
      t.string :onligne

      t.timestamps
    end
  end
end
