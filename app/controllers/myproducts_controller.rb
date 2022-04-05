class MyproductsController < ApplicationController
  def index
    @myproducts = Myproduct.unscoped
  end

  def new
    @myproduct = Myproduct.new
  end

  def create
    @myproduct = Myproduct.create(myproduct_params)
    if @myproduct.valid?
      flash[:errors] = "Product Created Successfully"
      redirect_to myproducts_path
    else
      flash[:errors] = @myproduct.errors.full_messages
      redirect_to new_myproduct_path
    end
  end

  def show
    @myproduct = Myproduct.find(params[:id])
  end

  def edit
    @myproduct = Myproduct.find(params[:id])
  end

  def update
    @myproduct = Myproduct.find(params[:id])
    if @myproduct.update(myproduct_params)
      flash[:errors] = "Product Updated Successfully"
      redirect_to myproduct_path(@myproduct)
    else
      flash[:errors] = @myproduct.errors.full_messages
      redirect_to edit_myproduct_path
    end
  end

  def destroy
    @myproduct = Myproduct.find(params[:id])
    if @myproduct.delete
      flash[:errors] = "Product Deleted Successfully"
      redirect_to root_path(@myproduct)
    else
      flash[:errors] = @myproduct.errors.full_messages
      redirect_to destroy_myproduct_path
    end
  end

  def defaultScope
    @myproductscope = Myproduct.all
  end

  private
  def myproduct_params
    params.require(:myproduct).permit(:title, :description, :price, :capacity, :is_active, :status)
  end
end
