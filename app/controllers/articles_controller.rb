class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout "home"
  def index
    @articles = Article.order(published_at: :desc).all
  end

  def show
  end
end
