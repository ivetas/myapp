class Admin::UsersController < Admin::AdminController
  # GET users
  def index
    @users = User.page(params[:page]).order("created_at desc")
  end

  # lietotājam pielieto funkciju ban(kas atrodas user model)
  def ban
    user = User.find(params[:id])
    user.ban
    if user.save
      redirect_to admin_users_path, notice: t('.notice')
    else
      redirect_to admin_users_path, alert: t('.alert')
    end
  end
  
  # lietotājam pielieto funkciju unban(kas atrodas user model)
  def unban
    user = User.find(params[:id])
    user.unban
    if user.save
      redirect_to admin_users_path, notice: t('.notice')
    else
      redirect_to admin_users_path, alert: t('.alert')
    end
  end
end
