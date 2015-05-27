class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  layout "home"
  # GET /receipts
  def index
    @categories = Category.all
    if params[:search]
      @receipts = Receipt.search(params[:search]).page(params[:page]).order("created_at DESC")
    else
      @receipts = Receipt.order("created_at DESC").page params[:page]
    end
  end

  # GET /receipts/1
  def show
    @receipt = Receipt.find(params[:id])
    @comments = @receipt.comments
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  def create
    @receipt = Receipt.create(receipt_params.merge(user_id: current_user.id))
      if @receipt.save
        redirect_to my_receipts_path, notice: t('.notice')
      else
        render action: :new
      end
  end

  # PATCH/PUT /receipts/1
  def update
    @receipt = Receipt.find(params[:id])
    if @receipt.update(receipt_params)
      redirect_to my_receipts_path, notice: t('.notice')
    else
       render action: :edit
    end
  end

  # DELETE /receipts/1
  def destroy
    @receipt.destroy
      redirect_to my_receipts_path, notice: t('.notice')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(
        :title, :description, :user_id, :photo, :components,
        :published, :published_at, :category_ids => [],
      )
    end
end
