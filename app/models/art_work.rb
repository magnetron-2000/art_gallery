class ArtWork < ApplicationRecord
  mount_uploader :attachment, ArtWorkUploader
  validates :user_id, presence: true
  validates :title, presence: true,  length: { minimum: 3 }
  validates :attachment, presence: true
end
