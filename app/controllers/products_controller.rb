class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product= Product.create(params.require(:product).permit(:name, :price, :description))
    if @product.valid?
      flash[:notice] = "Product Added!"
      redirect_to products_path
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:name, :price, :brand))
      flash[:notice]="Updated!"
      
      redirect_to product_path(@product)
    else
      flash[:errors]=@product.errors.full_messages
      redirect_to edit_product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:id])   
    if @product.delete   
      flash[:notice] = 'Product deleted!'   
      redirect_to root_path   
    else   
      flash[:errors] = @product.errors.full_messages
      redirect_to destroy_product_path
  end
end

# def product_params   
#   params.require(:product).permit(:name, :price, :description)
# end   
end
