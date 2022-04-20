class RproductsController < ApplicationController
  def index
    @rproducts = Rproduct.all
  end

  def new
    @rproduct = Rproduct.new
  end

  def create
    @rproduct = Rproduct.create(rproduct_params)
    if @rproduct.valid?
      flash[:errors] = "Product Created Successfully"
      redirect_to rproducts_path
    else
      flash[:errors] = @rproduct.errors.full_messages
      redirect_to new_rproduct_path
    end
  end

  def show
    @rproduct = Rproduct.find(params[:id])
    @rorders_of_rproduct = Rorder.where("rproduct_id = ?", @rproduct.id)
  end

  def edit
    @rproduct = Rproduct.find(params[:id])
  end

  def update
    @rproduct = Rproduct.find(params[:id])
    if @rproduct.update(rproduct_params)
      flash[:errors] = "Product Updated Successfully"
      redirect_to rproduct_path(@rproduct)
    else
      flash[:errors] = @rproduct.errors.full_messages
      redirect_to edit_rproduct_path
    end
  end

  def destroy
    @rproduct = Rproduct.find(params[:id])
    if @rproduct.delete
      flash[:errors] = "Product Deleted Successfully"
      redirect_to root_path(@rproduct)
    else
      flash[:errors] = @rproduct.errors.full_messages
      redirect_to destroy_rproduct_path
    end
  end

  private

  def rproduct_params
    params.require(:rproduct).permit(:title, :description, :price)
  end
end
