class Admin::ReceiptsController < Admin::AdminController
  before_action :set_receipt, only: [:destroy]

  # DELETE /receipts/1
  def destroy
    @receipt.destroy
      redirect_to receipts_path, notice: t('.notice')
  end

  def set_receipt
    @receipt = Receipt.find(params[:id])
  end
end
