class Admin::HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page]).reverse_order
     @tag_lists = Tag.all
     @posts = @posts.where('title LIKE ?', "%#{params[:search]}%")if params[:search].present?
     @page = 10
  end

  def about
  end

  layout 'admin'

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
