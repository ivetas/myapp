class HomeController < ApplicationController
  layout "home"
  # GET /receipts
  def index
    @rate = RatingCache.where("qty > 5").order("avg DESC").limit(5)
  end
end
