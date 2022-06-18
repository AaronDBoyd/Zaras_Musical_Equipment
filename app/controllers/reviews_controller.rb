class ReviewsController < ApplicationController
  before_action :authorize

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    if is_admin?
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      render :edit
    else
      flash[:alert] = "You aren't authorized to visit that page. Must be an Admin."
        redirect_to '/'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[:product_id])
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully DESTROYED!!"
    redirect_to product_path(@review.product)
  end

  private
    def review_params
      params.require(:review).permit(:author, :content, :rating)
    end

end