class UploadsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    upload = Upload.new(create_params)
    upload.update(challenge_id: params[:challenge_id], user_id: current_user.id)
    if upload.save
      user = User.find(upload.user_id)
      user.update(total_points: user.total_points + upload.challenge.points)

      redirect_to upload_path(upload)
    else
      flash.now[:error] = "Upload failed!"
      render :new
    end
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def index
    @uploads = Upload.all.reverse_order
    if params[:filter]
      challenge = Challenge.where(title: filter_params[:challenge]) if filter_params[:challenge].present?
      @uploads = @uploads.where(challenge_id: challenge) if filter_params[:challenge].present? 
    end

    respond_to do |format|
      format.html {render :index}
      format.js
    end
  end

  def autocomplete
    @challenge = Challenge.all
    @challenge = @challenge.starts_with(filter_params[:challenge]) if filter_params[:challenge].present? 
    
    respond_to do |format|
      format.json {render json:@challenge}
    end
  end
  
  private
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to session_new_path
    end
  end

  def create_params
    params.require(:upload).permit(:media)
  end
  
  def filter_params
    params.require(:filter).permit(:challenge)
  end
end
