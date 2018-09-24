class StoreController < ApplicationController
  def index
    @products = Product.recent.order("created_at desc").page(params[:page]).per(4).where(["name LIKE?", "%#{params[:search]}%"])
  end
end
