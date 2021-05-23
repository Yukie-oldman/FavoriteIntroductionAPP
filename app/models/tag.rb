class Tag < ApplicationRecord
  belongs_to :introduction
  validates :name, length: { maximum: 30 }
end
