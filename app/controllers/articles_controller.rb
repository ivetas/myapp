class ArticlesController < ApplicationController
  layout "home"
  #   GET articles
  def index
    @articles = Article.where(published: true).page(params[:page]).order(published_at: :desc)
  end
end
