class CocktailsController < ApplicationController
  before_action :find, only: %i[show destroy ]
  def index
    # listagem de todos os cocktails
    @cocktails = Cocktail.all
  end

  def new
    # pagina de formulario para criar um novo cocktail
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    # detalhes de UM cocktail

  end
  
  def destroy 
 
    @cocktail.destroy
    redirect_to cocktails_path
    
  end

  
  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find
   @cocktail = Cocktail.find(params[:id])

  end
end