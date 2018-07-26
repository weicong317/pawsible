class UploadsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    upload = Upload.new(create_params)
    upload.update(challenge_id: params[:challenge_id], user_id: current_user.id)
    if upload.save
      redirect_to upload_path(upload)
    else
      flash.now[:error] = "Upload failed!"
      render :new
    end
  end

  def show
  end

  def index
  end

  private
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to sign_in_path
    end
  end

  def create_params
    params.require(:upload).permit(:media)
  end  
end
