class Product1sController < ApplicationController
  def index
    @product1s = Product1.all
  end

  def new
    @product1 = Product1.new
  end

  def create
    @product1 = Product1.new(product1_params)
    if @product1.save
      flash[:errors] = "Product Created successfully"
      redirect_to product1s_path
    else
      flash[:errors] = @product1.errors.full_messages
      render :new
    end
  end

  def show
    @product1 = Product1.find(params[:id])
    @order1s_of_product1 = Order1.where("product1_id = ?", @product1.id)
  end

  def edit
    @product1 = Product1.find(params[:id])
  end

  def update
    @product1 = Product1.find(params[:id])
    if @product1 = Product1.update(product1_params)
      flash[:errors] = "Product Updated successfully"
      redirect_to product1s_path
    else
      flash[:errors] = @product1.errors.full_messages
      render :edit
    end
  end

  def destroy
    @product1 = Product1.find(params[:id])
    if @product1.destroy
      flash[:errors] = "Product Deleted Successfully"
      redirect_to product1s_path
    end
  end

  private

  def product1_params
    params.require(:product1).permit(:name, :price)
  end
end
