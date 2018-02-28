class ReviewsController < ApplicationController
      before_action :set_product, only: [:new, :create]

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    @review.product = @product
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user
    authorize @review
    if @review.save!
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_product
    @product = Product.find(params[:product_id])
    authorize @product
  end
end
