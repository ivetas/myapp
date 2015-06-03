class CategoriesController < ApplicationController
  layout "home"

  #   GET categories/1
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @receipts_category = @category.receipts.where(published: true).search(params[:search]).page(params[:page]).order("created_at DESC")
  end
end
