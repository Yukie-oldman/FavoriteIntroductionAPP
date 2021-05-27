class Introduction < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  
  validates :caption, presence: true, length: { maximum: 30 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :contents, presence: true, length: { maximum: 500 }

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  # attachment :image1
  # attachment :image2
  # attachment :image3
  
  def create_tags
    self.buf_tags.split(',').each { |tag| self.tags.create(name: tag) }
  end

  def update_tags
    self.tags.destroy_all
    self.create_tags
  end

  def good
    like = Like.where(introduction_id: self.id).count 
    return "#{like}いいね!" if like > 0 
  end
end
