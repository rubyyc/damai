class Admin::UsersController < AdminController
  before_action :require_admin!


  def index
    @users = User.includes(:groups).all
  end

  def edit
    @user = User.find(params[:id])
    @user.create_profile unless @user.profile
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:time_zone,:email, :role, :profile_attributes => [:id, :legal_name, :birthday, :location, :education, :occupation, :bio, :specialty] )
  end

end