class UsersController < ApplicationController
  before_action :set_user, except: %i[index]
  add_breadcrumb 'Home', :root_path
  add_breadcrumb 'Users'

  def index
    @grid = UsersGrid.new(grid_params) do |scope|
      scope.where(is_admin: false).page(params[:page])
    end
  end

  def profile
    add_breadcrumb "#{@user.id} / #{@user.name} / Profile"
  end

  def edit
    add_breadcrumb "#{@user.id} / #{@user.name} / Edit"
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    if @user.update(user_params)
      redirect_to profile_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_user
    @user = current_user.is_admin? ? User.find(params[:id]) : current_user
  end

  def grid_params
    params.fetch(:users_grid, {}).permit!
  end

  def user_params
    params.require(:user).permit(@user.is_admin? ? %i[phone_number] : helpers.editable_non_admin_columns.push(:profile_picture))
  end
end
