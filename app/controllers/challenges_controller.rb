class ChallengesController < ApplicationController
  before_action :require_admin, except: [:index]

  def new
  end

  def create
    challenge = Challenge.new(create_params)
    if challenge.save
      redirect_to challenges_path
    else
      flash.now[:error] = "Posting new challenge failed!"
      render :new
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    Challenge.find(params[:id]).update(update_params)
    redirect_to challenges_path
  end

  def index
    @challenges = Challenge.all.order(:created_at).reverse_order.limit(6)
  end

  private
  def create_params
    params.require(:challenges).permit(:title, :description, :points, :sponsor)
  end

  def update_params
    params.require(:edit_challenges).permit(:title, :description, :points, :sponsor).reject{|_, v| v.blank?}
  end

  def require_admin
    unless signed_in? && current_user.role === "admin"
      flash[:error] = "You must be ad admin and logged in to access this section"
      redirect_to session_new_path
    end
  end
end