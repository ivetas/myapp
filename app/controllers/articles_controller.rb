class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout "home"
  def index
    @articles = Article.where(published: true).page(params[:page]).order(published_at: :desc)
  end

  def show
  end
end
