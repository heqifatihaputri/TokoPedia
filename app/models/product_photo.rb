class ProductPhoto < ApplicationRecord
  mount_uploader :photo, ImageUploader
  belongs_to :product
end
