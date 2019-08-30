class UfosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :get_ufo, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: :list_own

  def search
    @ufos = Ufo.search_by_brand_and_description(params[:query])
    authorize @ufos
  end

  def index
    @ufos = policy_scope(Ufo)
  end

  def show
    authorize @ufo
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
      flash[:notice] = "You added a UFO. Thank You."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    authorize @ufo
  end

  def update
    authorize @ufo
    @ufo.update(ufo_params)
    redirect_to @ufo
  end

  def destroy
    authorize @ufo
    @ufo.destroy

    redirect_to root_path
  end

  def list_own
    @ufos = policy_scope(Ufo).where(owner_id: current_user.id)
  end

  private

  def ufo_params
    params.require(:ufo).permit(:brand, :speed, :age, :price, :description, :photo)
  end

  def get_ufo
    @ufo = Ufo.find(params[:id])
  end
end
