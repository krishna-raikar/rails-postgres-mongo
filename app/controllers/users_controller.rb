class UsersController < ApplicationController
  def index
    @users = User
  end

  def create
    user = User.new(users_params.except(:status))
    if user.save
      user.set_status(users_params[:status])
      redirect_to users_path, alert: 'user and status created successfully.'
    else
      redirect_to users_path, alert: 'error occured.'
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :status)
  end
end
