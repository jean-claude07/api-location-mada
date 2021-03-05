class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all.reorder('id DESC')

    render json: @users
  end

  def search
    @users = User.all.reorder('id DESC').where(["username LIKE ?", "%#{params[:username]}%"])
      if @users && @users.exists?
        render json: @users
      # elsif @user = User.all.reorder('id DESC').where(["email LIKE ?", "%#{params[:email]}%"])
      #   render json: @user
      else
        render json: {message: "Aucune resultat"}, status: 202
      end
  end

  def counteur
    @client = User.count

    render json: @client
  end

  # GET /users/1
  def show
    @userLocation = @user.locations
    counter = @userLocation.count
    token = encode_token({user_id: @user.id})
    render json: {client: @user, token: token, location: @userLocation, allReservation: counter}
  end

  # POST /users
  def create
    @user = User.create(user_params)

    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: @user, status: :created, location: @user, token: token}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def user_session
    @user = User.find_by_email(params[:email])


    if @user && @user.authenticate(params[:password])
      
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
      session[:current_user_id] = @user.id
    elsif user = User.find_by_password_digest(params[:password])
      if user
        token = encode_token({user_id: user.id})
        render json: {user: user, token: token}
      end
    else
      render json: {message: "Email ou mot de passe incorrect"}, status: 202
    end
    
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:username, :onligne, :email, :telephone, :password, :photoUser, :authentication_token)
    end
end
