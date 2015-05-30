class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  
  layout "home"
  def index
    @articles = Article.where(published: true).page(params[:page]).order(published_at: :desc)
  end
end
