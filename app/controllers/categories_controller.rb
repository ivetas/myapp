class CategoriesController < ApplicationController
  layout "home"

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @receipts_category = @category.receipts.where(published: true).search(params[:search]).page(params[:page]).order("created_at DESC")
  end
end
