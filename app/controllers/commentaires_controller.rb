class CommentairesController < ApplicationController
  before_action :set_commentaire, only: [:show, :update, :destroy]

  # GET /commentaires
  def index
    @commentaires = Commentaire.all

    render json: @commentaires
  end


  # POST /commentaires
  def create
    @commentaire = Commentaire.new(commentaire_params)

    if @commentaire.save
      render json: @commentaire, status: :created, location: @commentaire
    else
      render json: @commentaire.errors, status: :unprocessable_entity
    end
  end


  # DELETE /commentaires/1
  def destroy
    @commentaire.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentaire
      @commentaire = Commentaire.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def commentaire_params
      params.permit(:comment, :admin_id, :publication_id)
    end
end
