class RentalsController < ApplicationController
  def create
    @ufo = Ufo.find(params[:ufo_id])
    @rental = Rental.new(ufo_id: @ufo.id, customer_id: current_user.id)
    authorize @rental
    @rental.save
    @ufo.availability = false
    @ufo.save
    redirect_to ufo_path(@ufo)
  end
end
