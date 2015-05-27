class ReceiptCategoriesController < ApplicationController
  before_action :set_receipt_category, only: [:show]
  layout "home"
  # GET /receipt_categories
  def index
    @receipt_categories = ReceiptCategory.all
  end

  # GET /receipt_categories/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt_category
      @receipt_category = ReceiptCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_category_params
      params.require(:receipt_category).permit(:receipt_id, :category_id)
    end

end
