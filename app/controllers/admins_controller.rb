class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /admins
  def index
    @admins = Admin.all

    render json: @admins
  end

  def racine
    render json: {message: 'kaiz kaiz'}
  end

  def admin_session
    @admin = Admin.find_by_adminName(params[:adminName])


    if @admin && @admin.authenticate(params[:password])
      
      token = encode_token({user_id: @admin.id})
      render json: {user: {adminName: @admin.adminName, email: @admin.email, adminphoto: @admin.adminphoto}, token: token}
    else
      render json: {message: "Email ou mot de passe incorrect"}, status: 202
    end
    
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      token = encode_token({user_id: @admin.id})
      render json: {admin: {adminName: @admin.adminName, email: @admin.email, adminphoto: @admin.adminphoto}, 
      status: :created, location: {adminName: @admin.adminName, email: @admin.email, adminphoto: @admin.adminphoto}, token: token}
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # GET /admins/1
  def show
    token = encode_token({user_id: @admin.id})
    render json: {admin: {adminName: @admin.adminName, email: @admin.email, adminphoto: @admin.adminphoto}, token: token}
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.permit(:adminName, :email, :password, :adminphoto)
    end
end
