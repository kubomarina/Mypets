class User::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
    tag_list = params[:tag_name].split(",")
    if @post.save
      @post.save_posts(tag_list)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list)
  end

end
