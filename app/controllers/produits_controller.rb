class ProduitsController < ApplicationController
  before_action :set_produit, only: [:show, :update, :destroy]

  # GET /produits
  def index
    @produits = Produit.all.order('id DESC')

    render json: @produits
  end

  def search
    @produits = Produit.all.reorder('id DESC').where(["nom LIKE ?", "%#{params[:nom]}%"])
      if @produits && @produits.exists?
        render json: @produits
     
      else
        render json: {message: "Aucune resultat"}, status: 202
      end
  end

  def produitCount
    @counteur = Produit.count

    render json: @counteur
  end

  # GET /produits/1
  def show
    render json: @produit
  end

  # POST /produits
  def create
    @produit = Produit.new(produit_params)

    if @produit.save
      render json: @produit, status: :created, location: @produit
    else
      render json: @produit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /produits/1
  def update
    if @produit.update(produit_params)
      render json: @produit
    else
      render json: @produit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /produits/1
  def destroy
    @produit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produit
      @produit = Produit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def produit_params
      params.permit(:nom, :string, :cout, :description, :other, :groupe, :produitphoto)
    end
end
