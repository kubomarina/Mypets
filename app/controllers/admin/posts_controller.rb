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

  layout 'admin'

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
