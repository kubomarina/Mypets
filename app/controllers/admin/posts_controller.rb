class Admin::PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_path
  end

  def search
    if params[:keyword].present?
      @posts = Post.where('body LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

  def ranking
    @posts = Post.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @page = 10
  end

  layout 'admin'

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
