class Admin::ProductsController < Admin::ApplicationController
  def new
    @product = Product.new
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:notice] = "The Product Has Been Deleted."
    redirect_to @product
  end

  private

  def product_params
    params.require(:product).permit(:article_number,
      :article_name,
      :date_received,
      :article_location)
  end
end
