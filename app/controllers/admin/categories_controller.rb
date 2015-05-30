class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: t('.notice')
    else
      render action: :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: t('.notice')
    else
      render action: :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: t('.notice')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name)
    end
end
