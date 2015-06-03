class MyReceiptsController < ApplicationController
  layout "home"
  # GET /my_receipts
# Lietotājam redzamas viņa pievienotās receptes
  def index
    if current_user.present?
      @my_receipts = Receipt.where(user_id: current_user.id).page(params[:page]).order("created_at DESC")
    end
  end

  # GET /receipts/1
  def show
    @my_receipt = Receipt.find(params[:id])
  end
end
