class Order1sController < ApplicationController
  def index
    @order1s = Order1.all
  end

  def new
    @product1 = Product1.find(params[:product1_id])
    @order1 = Order1.new
  end

  def create
    @product1 = Product1.find(params[:product1_id])
    @order1 = @product1.order1s.new(order1_params)
    if @order1.save
      flash[:errors] = "Order Placed Successfully"
      redirect_to product1s_path
    else
      flash[:errors] = @order1.errors.full_messages
      render :new
    end
  end

  def show
    @order1 = Order1.find(params[:id])
  end

  def edit
    @product1 = Product1.find(params[:product1_id])
    @order1 = Order1.find(params[:id])
  end

  def update
    @order1 = Order1.find(params[:id])
    @product1 = Product1.find(params[:product1_id])
    if @order1.update(order1_params)
      flash[:errors] = "Order Updated Successfully"
      redirect_to product1_path(@product1)
    else
      render :edit
    end
  end

  def destroy
    @order1 = Order1.find(params[:id])
    if @order1.delete
      flash[:errors] = "Order1 Deleted Successfully"
      redirect_to product1s_path
    else
      flash[:errors] = @order1.errors.full_messages
      redirect_to destroy_order1_path
    end
  end

  private

  def order1_params
    params.require(:order1).permit(:quantity, :product1_id)
  end
end
