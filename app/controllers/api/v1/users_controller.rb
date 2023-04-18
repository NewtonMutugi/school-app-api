class Api::V1::UsersController < ActionController::API
  # Create a modal level method to generate the token
  # hancle errors in the new action
  respond_to :json
  def show
    @users = User.find(params[:id])
    render json: user, status: :ok
  end

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @users = User.new(user_params)

    if @users.save
      render json: @users, status: :created
    else
      render json: @users.errors, status: :unprocessable_entity
    end
  end

  def update
    @users = User.find(params[:id])

    if @users.update(user_params)
      render json: @users
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @users = User.find(params[:id])

    if @users.destroy
        head :ok
    else
      head :unprocessable_entity
    end
  end

  

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
