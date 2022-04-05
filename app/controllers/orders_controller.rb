class OrdersController < ApplicationController
  def index
    if params[:search]
        @orders = Order.all
        @orders = Order.where(status:'Booked') if params[:search] == 'Booked'
        @orders = Order.where(status:'Cancelled') if params[:search] == 'Cancelled'
      else
      @orders = Order.all
      end

      begin
        if !(params[:title].blank?)
          @orders_by_product = Myproduct.where(["title LIKE ?","%#{params[:title]}%"])[0].orders
        end
        rescue Exception
          flash[:notice] = "Record not found!"
          redirect_to orders_path
        end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    @temp= order_params[:myproduct_id]
    @myproduct_price = Myproduct.find(@temp)
    @order.total_price = @myproduct_price.price * @order.quantity
    if @order.valid?
      @order.save
      flash[:errors] = "Order Created Successfully"
      redirect_to orders_path
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to new_order_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      @temp= order_params[:myproduct_id]
      @myproduct_price = Myproduct.find(@temp)
      @order.total_price = @myproduct_price.price * @order.quantity
      @order.save
        flash[:errors] = "Order Updated Successfully"
        redirect_to order_path(@order)
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to edit_order_path
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.delete
      flash[:errors] = "Order Deleted Successfully"
      redirect_to root_path(@order)
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to destroy_order_path
    end
  end

  def root
  
  end
  

  private
  def order_params
    params.require(:order).permit(:quantity, :total_price, :status, :customer_id, :myproduct_id)
  end
end
