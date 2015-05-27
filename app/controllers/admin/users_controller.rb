class Admin::UsersController < Admin::AdminController
  def index
    @users = User.order("created_at desc").all
  end

  def ban
    user = User.find(params[:id])
    user.ban
    if user.save
      redirect_to admin_users_path, notice: t('.notice')
    else
      redirect_to admin_users_path, alert: t('.alert')
    end
  end

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
