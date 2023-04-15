class  Api::V1::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      @users = User.new(user_params)

      if @users.save
        render json: @user, status: :created
        # render json: { message: 'Signed up.' }, status: :created
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

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end
  def register_success
    render json: { message: 'Signed up.' }, status: :created
  end
  def register_failed
    render json: { message: "Signed up failure." }, status: :unprocessable_entity
  end
end
