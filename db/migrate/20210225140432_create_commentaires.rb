class CreateCommentaires < ActiveRecord::Migration[6.0]
  def change
    create_table :commentaires do |t|
      t.text :comment
      t.belongs_to :admin
      t.belongs_to :publication

      t.timestamps
    end
  end
end
