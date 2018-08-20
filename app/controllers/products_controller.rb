class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all
  end

  def show
  end

  def edit
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

    def set_product
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The Product You Were Looking for Could Not Be Found."
      redirect_to products_path
    end
    
    def product_params
      params.require(:product).permit(:article_number,
                                      :article_name,
                                      :date_received,
                                      :article_location)
    end
end
