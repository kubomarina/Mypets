class Admin::FavoriteController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_admin.favorites.new(post_id: post.id)
    favorite.save
    redirect_to admin_post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_admin.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to admin_post_path(post)
  end
end
