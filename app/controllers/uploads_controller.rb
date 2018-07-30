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
    @same_kind = Upload.where(challenge_id: @upload.challenge_id).order(:created_at).reverse_order
    @same_kind = @same_kind.where.not(id: params[:id])
    @same_kind = @same_kind.limit(8)
  end

  def index
    @uploads = Upload.all.reverse_order
  end

  def index_video
    @uploads = Upload.all.reverse_order

    respond_to do |format|
      format.js
    end
  end

  def index_image
    @uploads = Upload.all.reverse_order

    respond_to do |format|
      format.js
    end
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
