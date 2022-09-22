class ArtWork < ApplicationRecord
  mount_uploader :attachment, ArtWorkUploader
end
