class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
  before_action :authenticate_user!

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.page(params[:page]).per(4).where(["name LIKE?", "%#{params[:search]}%"])
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = current_user.build_store
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = current_user.build_store(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow
    if current_user.store == @store
      redirect_to store_path(@store), notice: 'You cant follow yourself.'
    else
      current_user.follow(@store)
      @follow = Follow.find_by(follower: current_user, followable: @store)
        redirect_to store_path(@store)
    end
  end

  def unfollow
    current_user.stop_following(@store)
    redirect_to store_path(@store)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :description, :logo, :latitude, :longitude, :address)
    end
end
