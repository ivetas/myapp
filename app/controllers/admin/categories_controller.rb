class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET admin/categories
  def index
    @categories = Category.all
  end

  # GET admin/categories/new
  def new
    @category = Category.new
  end

  # GET admin/categories/edit
  def edit
  end

  # POST admin/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: t('.notice')
    else
      render action: :new
    end
  end

  # PATCH/PUT admin/categories/1
  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: t('.notice')
    else
      render action: :edit
    end
  end

  # DELETE admin/categories/1
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
