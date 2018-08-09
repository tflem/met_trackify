class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:notice] = "The Product Has Been Deleted."
    redirect_to @product
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
