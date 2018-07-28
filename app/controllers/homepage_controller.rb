class HomepageController < ApplicationController
  def index
    @top_dog = User.all.order(:total_points).reverse_order.limit(3)
    @uploads = Upload.all.order(:created_at).reverse_order.limit(6)
    @leaderboard = User.all.order(:total_points).reverse_order.limit(10)
  end

  def session_new
  end
end
