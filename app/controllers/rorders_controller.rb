class RordersController < ApplicationController
  def index
    @rorders = Rorder.all
  end

  def new
    @rproduct = Rproduct.find(params[:rproduct_id])
    @rorder = Rorder.new
  end

  def create
    @rproduct = Rproduct.find(params[:rproduct_id])
    @rorder = @rproduct.rorders.new(rorder_params)
    @rorder.total_price = @rproduct.price * @rorder.quantity
    if @rorder.save
      flash[:errors] = "Order Placed Successfully"
      redirect_to rproducts_path
    else
      flash[:errors] = @rorder.errors.full_messages
      redirect_to new_rproduct_rorder_path
    end
  end

  def show
    @rorder = Rorder.find(params[:id])
  end

  def edit
    @rproduct = Rproduct.find(params[:rproduct_id])
    @rorder = Rorder.find(params[:id])
  end

  def update
    @rorder = Rorder.find(params[:id])
    @rproduct = Rproduct.find(params[:rproduct_id])
    if @rorder.update(rorder_params)
      @rorder.total_price = @rproduct.price * @rorder.quantity
      @rorder.save
      flash[:errors] = "Rorder Updated Successfully"
      redirect_to rproduct_path(@rproduct)
    else
      flash[:errors] = @rorder.errors.full_messages
      redirect_to edit_rorder_path
    end
  end

  def destroy
    @rorder = Rorder.find(params[:id])
    if @rorder.delete
      flash[:errors] = "Rorder Deleted Successfully"
      redirect_to root_path(@rorder)
    else
      flash[:errors] = @rorder.errors.full_messages
      redirect_to destroy_rorder_path
    end
  end

  private

  def rorder_params
    params.require(:rorder).permit(:quantity, :total_price, :rproduct_id)
  end
end
