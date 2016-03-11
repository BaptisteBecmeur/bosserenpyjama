class Category < ActiveRecord::Base
  belongs_to :post, dependent: :destroy


  validates :name, presence: true, length: { minimum: 1 }
end
