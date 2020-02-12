class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :users
  has_many :likes, through: :favorites, source: :user
  
  
  def favorite(user)
    Favorites.create(user_id: user.id)
  end
  
  def unfavorite(user)
    Favorites.find_by(user_id: user.id).destroy
  end  
end
