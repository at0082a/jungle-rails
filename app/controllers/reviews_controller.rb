class ReviewsController < ApplicationController
    def new
       @review = Review.new
    end

    def create
      @product = Product.find(params[:product_id])
      @review = @product.reviews.build(review_params)
      @review.user_id = current_user.id

      if @review.save!
        redirect_to @product
      else
        redirect_to @product
      end
   end

   private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end
end
