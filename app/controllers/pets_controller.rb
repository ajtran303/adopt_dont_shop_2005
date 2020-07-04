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
    Pet.create(pet_params)
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  private
  def pet_params
    pet = params.permit(:image, :name, :sex, :description, :status, :approximate_age)
    pet.to_h
    pet[:status] = "Adoptable"
    pet[:shelter_id] = params[:id]
    pet
  end
end
