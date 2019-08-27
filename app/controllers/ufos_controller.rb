class UfosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :get_ufo, only: [:show, :edit, :update]
  skip_after_action :verify_authorized, only: :list_own

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
    authorize @ufo
    if @ufo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @ufo = Ufo.find(params[:id])
    authorize @ufo
  end

  def edit
    # @ufo = Ufo.find(params[:id])
    authorize @ufo
  end

  def update
    # @ufo = Ufo.find(params[:id])
    authorize @ufo
    @ufo.update(ufo_params)
    redirect_to @ufo
  end

  def destroy
    # byebug
    @ufo = Ufo.find(params[:id])
    authorize @ufo
    @ufo.destroy

    redirect_to root_path
  end

  def list_own
    @ufos = policy_scope(Ufo).where(owner_id: current_user.id)
  end

  private

  def ufo_params
    params.require(:ufo).permit(:brand, :speed, :age, :price, :description)
  end

  def get_ufo
    @ufo = Ufo.find(params[:id])
  end
end
