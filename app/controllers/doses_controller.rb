class DosesController < ApplicationController
  before_action :set_cocktail, only: %i[ edit update destroy ]
  before_action :find_cocktails, except: %i[ edit update destroy]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
     @dose.cocktail = @cocktail
    if @dose.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def edit; end

  def update 
    @dose.update 
    redirect_to @dose.cocktail
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private
  
  def set_coctails
    @cocktail = Coctails.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktails 
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
