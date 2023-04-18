class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json
  def create
    @user = User.where(email: user_params[:email]).first

    if @user&.valid_password?(user_params[:password]) #&. is a safe navigation operator
      sign_in :user, @user
      render json: @user, status: :ok
    else
      render json: { errors: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    sign_out current_user, status: :ok
    render json: { success: true }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def respond_with(resource, _opts = {})
    render json: { message: 'Logged.' }, status: :ok

  end
  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end
  def log_out_success
    render json: { message: "Logged out." }, status: :ok
  end
  def log_out_failure
    render json: { message: "Logged out failure."}, status: :unauthorized
  end

end

# class  Api::V1::SessionsController < Devise::SessionsController
#   respond_to :json
  # private
  # def respond_with(resource, _opts = {})
  #   render json: { message: 'Logged.' }, status: :ok

  # end
  # def respond_to_on_destroy
  #   current_user ? log_out_success : log_out_failure
  # end
  # def log_out_success
  #   render json: { message: "Logged out." }, status: :ok
  # end
  # def log_out_failure
  #   render json: { message: "Logged out failure."}, status: :unauthorized
  # end
# end

# class Api::V1::SessionsController < Devise::SessionsController
#   respond_to :json

#   private

#   def respond_with(resource, _opts = {})
#     render json: { message: 'Logged in succejkssfully.' }, status: :ok
#   end

#   def respond_to_on_destroyss
#     head :failure
#   end
# end

