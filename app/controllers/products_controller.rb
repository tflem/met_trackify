class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = policy_scope(Product)
  end

  def show
    authorize @product, :show?
  end

  def edit
    authorize @product, :update?
  end

  def update
    authorize @product, :update?
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
