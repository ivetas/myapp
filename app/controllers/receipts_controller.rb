class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  layout "home"

  # GET /receipts
  # Redzamas visas kategorijas, publicētās receptes, sakārtotas pēc izveidošanas
  # datuma. Recepšu meklēsana
  def index
    @categories = Category.all
    if params[:search]
      @receipts = Receipt.where(published: true).search(params[:search]).page(params[:page]).order("created_at DESC")
    else
      @receipts = Receipt.where(published: true).page(params[:page]).order("created_at DESC")
    end
  end

  # GET /receipts/1
  # Redz receptes detaļas un tai pievienotos komentārus
  def show
    @comments = @receipt.comments.page(params[:page])
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  # Jaunas receptes izveide.
  def create
    @receipt = Receipt.create(receipt_params.merge(user_id: current_user.id))
      if @receipt.save
        redirect_to my_receipts_path, notice: t('.notice')
      else
        render action: :new
      end
  end

  # PATCH/PUT /receipts/1
  # Receptes labošana
  def update
    @receipt = Receipt.find(params[:id])
    if @receipt.update(receipt_params)
      redirect_to my_receipts_path, notice: t('.notice')
    else
       render action: :edit
    end
  end

  # DELETE /receipts/1
  # Receptes dzēšana
  def destroy
    @receipt.destroy
      redirect_to my_receipts_path, notice: t('.notice')
  end

  private
    # Uzstāda recepti
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Receptes parametri
    def receipt_params
      params.require(:receipt).permit(
        :title, :description, :user_id, :photo, :components,
        :published, :published_at, :category_ids => [],
      )
    end
end
