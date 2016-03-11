class Category < ActiveRecord::Base
  belongs_to :post, dependent: :destroy

  CATS = ["WordPress", "HTML", "CSS", "SEO", "TUTO", "Case Study", "Interview", "Life-Style"]
  validates :name, inclusion: { in: Category::CATS, allow_nil: false }
end
