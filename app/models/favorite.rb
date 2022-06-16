class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :catalog

  validates_uniqueness_of :catalog_id, scope: :user_id
end
