class Admin::ArticlesController < Admin::AdminController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = ::Article.order(published_at: :desc).all
  end

  def show
  end

  def new
    @article = ::Article.new
  end

  def edit
  end

  def create
    @article = ::Article.new(article_params)

    if @article.save
      redirect_to admin_articles_path, notice: t('.notice')
    else
      render action: :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: t('.notice')
    else
      render action: :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: t('.notice')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = ::Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(
        :title, :text, :published, :published_at, :photo
      )
    end
end
