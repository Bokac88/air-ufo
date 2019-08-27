class RentalsController < ApplicationController
  def create
    @ufo = Ufo.find(params[:id])
    @rental = Rental.new(ufo_id: @ufo.id, customer_id: current_user.id)
    @rental.save
    @ufo.availability = false
    @ufo.save
    redirect_to ufo_path
  end

  private

  def rental_params
    params.require(:rental)
  end
end
