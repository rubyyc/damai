class AdminController < ApplicationController
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # before_action :require_admin!

  layout "admin"

     protected

     def require_admin!
       unless current_user.is_admin?
                   flash[:alert] = "您的权限不足"
                   redirect_to root_path
                 end
     end

     def require_editor!
       unless current_user.is_editor?
                   flash[:alert] = "您的权限不足"
                   redirect_to root_path
                 end
       end
end
