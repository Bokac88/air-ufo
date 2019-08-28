class ReviewsController < ApplicationController
  before_action :fetch_rental, only: %i[new create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    authorize @review
    if @rental.review.present?
      redirect_to rentals_path, alert: "You can only write one review per booking"
    end
  end

  def create
    @review = Review.new(review_params)
    @review.rental = @rental
    authorize @review
    if @review.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def fetch_rental
    @rental = Rental.find(params[:rental_id])
  end
end
