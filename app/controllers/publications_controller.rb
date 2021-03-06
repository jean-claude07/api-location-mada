class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :update, :destroy]

  # GET /publications
  def index
    @publications = Publication.all.order('id DESC')

    render json: @publications
  end

  # GET /publications/1
  def show
    
      @count = @publication.like
      @counter = @count.count 
    render json: {publication: {description: @publication.description, title: @publication.title, 
    admin_id: @publication.admin_id, publishingphoto: @publication.publishingphoto}, like: @counter}
  end

  # POST /publications
  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      render json: @publication, status: :created, location: @publication
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publications/1
  def update
    if @publication.update(publication_params)
      render json: @publication
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def publication_params
      params.permit(:description, :title, :admin_id, :publishingphoto)
    end
end
