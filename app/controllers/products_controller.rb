class ProductsController < ApplicationController

  def home
    if params[:sort] == "usa"
      @products = Product.usa
    elsif params[:sort] == "most_reviews"
      @products = Product.most_reviews
    else params[:sort] == "recent"
      @products = Product.last_three
    end 
    render :home
  end

  def index
    @products = Product.all.paginate(:page => params[:page], per_page:10)
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end
  end

    def edit
      @product = Product.find(params[:id])
      render :edit
    end

    def show
      @product = Product.find(params[:id])
      render :show
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:notice] = "Product successfully updated!"
        redirect_to products_path
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      flash[:notice] = "Product successfully DESTROYED!!"
      redirect_to products_path
    end

    private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
  end