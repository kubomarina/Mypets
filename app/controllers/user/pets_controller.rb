class User::PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def index
    @pets = Pet.page(params[:page]).reverse_order
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save
    redirect_to pet_path(@pet.id)
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet.id)
  end

  private

  def pet_params
    params.require(:pet).permit(:Animal_name, :introduction, :pet_image, :food, :hobby, :tool, :user_id, :caution)
  end
end
