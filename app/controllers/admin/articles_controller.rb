class Admin::ArticlesController < Admin::AdminController
  before_action :set_article, only: [:edit, :update, :destroy]

  # GET admin/articles
  def index
    @articles = ::Article.page(params[:page]).order(published_at: :desc)
  end

  # GET admin/articles/new
  def new
    @article = ::Article.new
  end

  # GET admin/articles/edit
  def edit
  end

  # POST admin/articles
  def create
    @article = ::Article.new(article_params)

    if @article.save
      redirect_to admin_articles_path, notice: t('.notice')
    else
      render action: :new
    end
  end

  # PATCH/PUT admin/articles/1
  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: t('.notice')
    else
      render action: :edit
    end
  end

  # DELETE admin/articles/1
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
        :title, :description, :published, :published_at, :photo
      )
    end
end
