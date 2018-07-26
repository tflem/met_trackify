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

  private
    
    def product_params
      params.require(:product).permit(:article_number, :article_name,
                                      :date_received, :article_location)
    end
end
