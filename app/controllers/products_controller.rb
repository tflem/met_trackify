class ProductsController < ApplicationController
  def index
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product Information Created."
      redirect_to @product
    else
      # notta thing, as of yet.
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
