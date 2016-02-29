class Post < ActiveRecord::Base
  belongs_to :user

  TAGS = ["Design", "Mode", "Tendance", "Life-Style", "Tradition", "Gastronomie", "Insolite", "Technologie"]

  validates :tag, inclusion: { in: Post::TAGS, allow_nil: false }
  validates :user_id, presence: true
  validates :content, presence: true
end
