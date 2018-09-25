class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :like, :dislike]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /products
  # GET /products.json
  def index
    @products = current_user.store.products.page(params[:page]).per(4)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product_photos = @product.product_photos.all
  end

  # GET /products/new
  def new
    @product = current_user.store.products.build
    @product_photo = @product.product_photos.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.store.products.build(product_params)

    respond_to do |format|
      if @product.save
        params[:product_photos]['photo'].each do |a|
          @product_photo = @product.product_photos.create!(:photo => a)
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
          # to handle multiple images upload on update when user add more picture
        if params[:product_photos]
          params[:product_photos]['photo'].each do |a|
          @product_photo = @product.product_photos.create!(:photo => a)
        end
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @product.upvote_from current_user
    redirect_to product_path
  end

  def gallery
    @images = Dir.chdir(Rails.root.join('app/assets/images')) do
      Dir.glob("galleria/landscape/*.jpg")
    end
  end

  def dislike
    @product.downvote_from current_user
    redirect_to product_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image, :price, :expired, :store_id, :category_id, :sub_category_id, product_photos_attributes: [:id, :product_id, :photo])
    end
end
