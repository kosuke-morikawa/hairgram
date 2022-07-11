class Comment < ApplicationRecord
  belongs_to :catalog
  belongs_to :user
end
