class Catalog < ApplicationRecord
  belongs_to :user
  attachment :image
end
