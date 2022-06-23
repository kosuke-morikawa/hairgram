class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :catalogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :username, presence: true

  def already_favorited?(catalog)
    self.favorites.exists?(catalog_id: catalog.id)
  end
  
end
