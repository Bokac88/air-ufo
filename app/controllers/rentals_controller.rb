class RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental)
  end

  def create
    @ufo = Ufo.find(params[:ufo_id])
    @rental = Rental.new(ufo_id: @ufo.id,
                         customer_id: current_user.id,
                         start_date: params[:start_date],
                         end_date: params[:end_date])
    authorize @rental
    @rental.save
    @ufo.availability = false
    @ufo.save
    redirect_to ufo_path(@ufo)
  end
end
