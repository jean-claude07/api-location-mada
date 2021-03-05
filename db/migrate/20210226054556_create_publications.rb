class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.text :description
      t.string :title
      t.belongs_to :admin

      t.timestamps
    end
  end
end
