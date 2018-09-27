class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart

  def my_store
    @store = current_user.store
    redirect_to store_path(@store)
  end
end
