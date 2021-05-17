class Introduction < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  
  validates :caption, presence: true, length: { maximum: 30 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :contents, presence: true, length: { maximum: 300 }

  attachment :image1
  attachment :image2
  attachment :image3
  
  def create_tags(tags)
    tags.split(',').each do |tag|
      self.tags.create(name: tag)
    end
  end

  def good
    like = Like.where(introduction_id: self.id).count 
    return "#{like}いいね!" if like > 0 
  end
end
