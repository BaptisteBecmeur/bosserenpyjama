class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :biography, :text
    add_column :users, :job, :string
    add_column :users, :website, :string
    add_column :users, :social_link1, :string
    add_column :users, :social_link2, :string
    add_column :users, :social_link3, :string
  end
end
