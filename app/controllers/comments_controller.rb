class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :destroy]

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  def create
    @receipt = Receipt.find(params[:receipt_id])
    @comment = current_user.comments.build(comment_params)
    @comment.receipt_id = @receipt.id
    if @comment.save
      redirect_to receipt_path(@receipt), notice: t('.notice')
    else
      redirect_to receipt_path(@receipt), alert: t('.alert')
    end
  end

  # DELETE /comments/1
  def destroy
    @receipt = Receipt.find(params[:receipt_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
      redirect_to receipt_path(@receipt), notice: t('.notice')
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :receipt_id)
    end
end
