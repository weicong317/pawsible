class UsersController < ApplicationController
  def create
    @user = User.new(create_params)
    @user.update(status: 0)
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      flash.now[:error] = "Sign up failed!"
      render "new"
    end
  end

  private
  def create_params
    params.require(:user).permit(:owner_name, :email, :password, :dog_name, :breed, :bio)
  end
end