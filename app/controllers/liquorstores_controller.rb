class LiquorstoresController < ApplicationController

  before_action :set_liquorstore, only: [:show, :edit]

  def index
    @liquorstores = Liquorstore.all
    @hash = Gmaps4rails.build_markers(@liquorstores) do |liquorstore, marker|
      marker.lat liquorstore.latitude
      marker.lng liquorstore.longitude
    end
  end

  def edit
  end

  def show
    @liquorstores = Liquorstore.near([@liquorstore.latitude, @liquorstore.longitude], 5)
    @hash = Gmaps4rails.build_markers(@liquorstores) do |liquorstore, marker|
    marker.lat liquorstore.latitude
    marker.lng liquorstore.longitude
    end    
  end

  def new
    @liquorstore = Liquorstore.new
  end

  def create
    @liquorstore = current_user.liquorstores.build(liquostore_params)
    @liquorstore.user = current_user    

    respond_to do |format|
      if @liquorstore.save
        format.html { redirect_to root_path, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, store: @liquorstore }
      else
        format.html { render :new }
        format.json { render json: @liquorstore.errors, status: :unprocessable_entity }
      end
    end

  end

    def set_liquorstore
      @liquorstore = Liquorstore.find(params[:id])
    end

    def liquostore_params
      params.require(:liquorstore).permit(:name, 
        :address, 
        :openh, 
        :closeh, 
        :latitude, 
        :longitude,
        :user_id
        )
    end
end
