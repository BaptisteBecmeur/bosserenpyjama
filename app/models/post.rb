class Post < ActiveRecord::Base
  belongs_to :user
  has_many :categories, dependent: :destroy
  has_many :favs, dependent: :destroy

  TAGS = ["Design", "Mode", "Tendance", "Life-Style", "Tradition", "Gastronomie", "Insolite", "Technologie"]

  validates :tag, inclusion: { in: Post::TAGS, allow_nil: false }
  validates :user_id, presence: true
  validates :content, presence: true

  mount_uploader :cover, ImageUploader

  include PgSearch
  pg_search_scope :search,
    against: [ :title, :content, :tag ],
    associated_against: {
      categories: [:name]
    }

  def is_faved_by(user)
    self.favs.where(user: user).take
  end

end
