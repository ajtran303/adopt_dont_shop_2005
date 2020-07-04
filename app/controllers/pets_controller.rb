class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    Pet.create(create_pet_params)
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(update_pet_params)
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  private
  def pet_params
    params.permit(:image, :name, :sex, :description, :approximate_age)
  end

  def create_pet_params
    pet = pet_params
    pet.to_h
    pet[:status] = "Adoptable"
    pet[:shelter_id] = params[:id]
    pet
  end

  def update_pet_params
    pet_params.reject { |_, param| param.empty? }
  end
end
