class HomeController < ApplicationController
  layout "home"
  # GET /receipts
  def index
    @rate = RatingCache.order("avg DESC").limit(5)
  end
end
