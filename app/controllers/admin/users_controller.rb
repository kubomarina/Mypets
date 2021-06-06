class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).order(id:"ASC")
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  layout 'admin'

  private

  def user_params
   params.require(:user).permit(:owner_name, :profile_image, :pet_kind, :introduction)
  end
end
