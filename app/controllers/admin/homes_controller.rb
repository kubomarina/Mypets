class Admin::HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page]).reverse_order
  end
  
  def about 
  end
  
  layout 'admin'
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
