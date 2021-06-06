class Admin::PetsController < ApplicationController
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

  layout 'admin'

  private

  def pet_params
    params.require(:pet).permit(:Animal_name, :introduction, :pet_image, :food, :hobby, :tool, :user_id, :caution)
  end
end
