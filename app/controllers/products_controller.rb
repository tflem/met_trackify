class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product Information Created."
      redirect_to @product
    else
      flash.now[:alert] = "Product Information Has Not Been Created."
      render "new"
    end
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:notice] = "Product Has Been Updated."
      redirect_to @product 
    else
      flash[:alert] = "Product Has Not Been Updated."
      render "edit"
    end
  end    

  private
    
    def product_params
      params.require(:product).permit(:article_number, :article_name,
                                      :date_received, :article_location)
    end
end
