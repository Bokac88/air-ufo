class UfosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
    @ufos = Ufo.all
  end

  def new
    @ufo = Ufo.new
  end

  def create
    @ufo = Ufo.new(ufo_params)
    @ufo.save
    redirect_to root_path
  end

  private

  def ufo_params
    params.require(:ufo).permit(:brand, :speed, :age, :price, :description)
  end
end
