class UfosController < ApplicationController
  before_action :get_ufo, only: [ :show, :destroy ]
  skip_before_action :authenticate_user!, only: :index

  def index
    @ufos = policy_scope(Ufo)
  end

  def new
    @ufo = Ufo.new
    authorize @ufo
  end
  
  def create
    @ufo = Ufo.new(ufo_params)
    @ufo.owner = current_user
    if @ufo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    authorize @ufo
  end

  def destroy
    # byebug
    @ufo.destroy
    authorize @ufo

    redirect_to root_path
  end

  private

  def ufo_params
    params.require(:ufo).permit(:brand, :speed, :age, :price, :description)
  end

  def get_ufo
    @ufo = Ufo.find(params[:id])
  end
end
