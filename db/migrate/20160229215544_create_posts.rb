class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :cover
      t.string :title
      t.text :introduction
      t.text :content
      t.string :tag
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
