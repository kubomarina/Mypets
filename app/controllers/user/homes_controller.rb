class User::HomesController < ApplicationController
  def top
     @posts = Post.page(params[:page]).reverse_order
     
     @posts = @posts.where('title LIKE ?', "%#{params[:search]}%")if params[:search].present?
  end
end
