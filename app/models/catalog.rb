class Catalog < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :favorites, dependent: :destroy

  def self.search(search)
    if search != ""
      Catalog.where('text LIKE(?)', "%#{search}%")
    else
      Catalog.all
    end
  end
  
  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
