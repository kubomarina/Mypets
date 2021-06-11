class Admin::PostsController < ApplicationController
  before_action :posts
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

  layout 'admin'

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
