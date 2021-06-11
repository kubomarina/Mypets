class Admin::PetsController < ApplicationController
  before_action :pets
  
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to admin_pets_path
  end

  def search
    if params[:keyword].present?
      @pets = Pet.where('Animal_name LIKE ?',"%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @pets = Pet.all
    end
  end


  layout 'admin'

  private

  def pet_params
    params.require(:pet).permit(:Animal_name, :introduction, :pet_image, :food, :hobby, :tool, :user_id, :caution)
  end
end
