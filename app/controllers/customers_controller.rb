class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    if @customer.valid?
      flash[:errors] = "Customer Created Successfully"
      redirect_to customers_path
    else
      flash[:errors] = @customer.errors.full_messages
      redirect_to new_customer_path
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:errors] = "Customer Updated Successfully"
      redirect_to customer_path(@customer)
    else
      flash[:errors] = @customer.errors.full_messages
      redirect_to edit_customer_path
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.delete
      flash[:errors] = "Customer Deleted Successfully"
      redirect_to root_path(@customer)
    else
      flash[:errors] = @customer.errors.full_messages
      redirect_to destroy_customer_path
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:fname, :lname, :email, :phone_number)
  end
end
