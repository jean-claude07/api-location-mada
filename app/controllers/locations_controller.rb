class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all

    render json: @locations
  end

  def countLocation
    @counter = Location.count

    render json: @counter
  end
  

  # GET /locations/1
  def show
    render json: @location
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      render json: {location: {id: @location.id, nomMvola: @location.nomMvola, nombre: @location.nombre, numero: @location.numero, 
      nomProduit: @location.nomProduit, cout: @location.cout, payment: @location.payment, date: @location.date, 
      user_id: @location.user_id, image: @location.image}, status: :created, location: @location, message: "Reservation reusssie ..! Merci :-)"}
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: {location: {id: @location.id, nomMvola: @location.nomMvola, nombre: @location.nombre, numero: @location.numero, 
      nomProduit: @location.nomProduit, cout: @location.cout, payment: @location.payment, date: @location.date, 
      user_id: @location.user_id, image: @location.image}, 
      message: "Payment fait avec success!"}
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.permit(
        :nomMvola, :nombre, :numero, :nomProduit, :cout, :payment, :date, :user_id, :image
      )
    end
end
