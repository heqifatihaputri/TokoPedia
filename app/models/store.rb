class Store < ApplicationRecord
  mount_uploader :logo, ImageUploader
  belongs_to :user
  has_many :products

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def full_address
  [country, city, street].compact.join(‘, ‘)
  end

  acts_as_followable
  acts_as_follower
end
