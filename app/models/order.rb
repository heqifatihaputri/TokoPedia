class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  after_create :send_welcome_email
  
  private
  
  def send_welcome_email
    NotificationMailer.send_email(self).deliver
  end
end
