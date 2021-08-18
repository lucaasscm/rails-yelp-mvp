class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    # repare que o :restaurant_id nao esta presente aqui. Nao queremos que
    # o user nos passe essa informacao (pois pegaremos ela da url)
    params.require(:review).permit(:rating, :content)
  end
end
