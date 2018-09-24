class ProductPhotosController < ApplicationController
  def destroy
    @product_photo = ProductPhoto.find(params[:id])
    product = @product_photo.product
    @product_photo.destroy
    respond_to do |format|
      format.html {redirect_to product_url(product), notice: 'Item photo was successfully destroyed.'}
    end
  end
end
