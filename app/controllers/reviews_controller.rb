class ReviewsController < ApplicationController
    def create
      @product = Product.find(params[:product_id])
      @review = @product.reviews.build

      if @review.save
        ;flash[:notice] = 'Review was successfully created.'
        redirect_to @product
        else
        flash[:notice] = "Error creating review: #{@review.errors}"
        redirect_to @product
      end
   end
end
