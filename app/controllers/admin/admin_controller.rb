class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!, :admin_required
  layout "home"
  private
  
    def admin_required
      unless current_user.is_admin == true
        redirect_to  new_user_session_path
      end
    end
end
