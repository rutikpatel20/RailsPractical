class ProductsController < ApplicationController

  # Index Method
  def index
    @products = Product.all
  end

  # Method For Showing Products
  def show
    @product = Product.find(params[:id])
  end

   # Method For Adding New Products
  def new
    @product = Product.new
  end

   # Method For Creating Products
  def create
    @product = Product.create(params.require(:product).permit(:name, :price, :description))
    if @product.valid?
      flash[:notice] = "Product Added!"
      redirect_to products_path
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to new_product_path
    end
  end

   # Method For Edit Details of Products
  def edit
    @product = Product.find(params[:id])
  end

   # Method For Updating Products
  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:name, :price, :brand))
      flash[:notice]="Product Updated!"
      redirect_to product_path(@product)
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to edit_product_path(@product)
    end
  end

   # Method For Destroying Product
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
  
end
