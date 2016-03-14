class Category < ActiveRecord::Base
  belongs_to :post

  validates :name, presence: true
end
