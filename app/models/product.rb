class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON # If you use SQLite, add this line

  belongs_to :user, optional: true
  belongs_to :store
  has_many :line_items
  has_many :product_photos
  belongs_to :category
  belongs_to :sub_category
  counter_culture [:sub_category, :category]
  counter_culture [:sub_category]
  accepts_nested_attributes_for :product_photos, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }

  before_destroy :not_referenced_by_any_line_item

  validates :price, presence: true
  validates :name, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed." }
  validates :price, length: { maximum: 12 }

  acts_as_commontable

  scope :recent, -> { where('expired > :date', date: DateTime.now) }

  acts_as_votable

  private
  # ensure that there are no line items referencing this product
    def not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end

end
