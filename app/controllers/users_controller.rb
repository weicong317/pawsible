class UsersController < ApplicationController
  def new 
  end
  
  def create
    @user = User.new(create_params)
    @user.update(status: 0, total_points: 0)
    if @user.save
      sign_in @user
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "Sign up failed!"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update(update_params)
    redirect_to user_path(params[:id])
  end

  def profilePic
    @user = User.find(params[:id])
  end

  def profilePic_update
    User.find(params[:id]).update(profilePic_params)
    redirect_to user_path(params[:id])
  end

  def leaderboard
    @leaderboard = User.all.order(:total_points).reverse_order
  end

  private
  def create_params
    params.require(:user).permit(:owner_name, :email, :password, :dog_name, :breed, :bio, :profile_pic)
  end

  def update_params
    params.require(:profile).permit(:dog_name, :owner_name, :bio).reject{|_, v| v.blank?}
  end

  def profilePic_params
    params.require(:profile_pic).permit(:profile_pic)
  end
end