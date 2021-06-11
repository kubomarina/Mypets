class Admin::UsersController < ApplicationController
  before_action :user
  def index
    @users = User.page(params[:page]).order(id:"ASC")
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def search
    if params[:keyword].present?
      @users = User.where('owner_name LIKE ?',"%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @users = Usere.all
    end
  end

  layout 'admin'

  private

  def user_params
   params.require(:user).permit(:owner_name, :profile_image, :pet_kind, :introduction)
  end
end
