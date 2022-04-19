class Business::RcustomersController < ApplicationController
  def index
    @rcustomers = Rcustomer.all
  end

  def new
    @rcustomer = Rcustomer.new
  end

  def create
    @rcustomer = Rcustomer.create(rcustomer_params)
    if @rcustomer.valid?
      flash[:errors] = "Customer Created Successfully"
      redirect_to business_rcustomers_path
    else
      flash[:errors] = @rcustomer.errors.full_messages
      redirect_to new_business_rcustomer_path
    end
  end

  def edit
    @rcustomer = Rcustomer.find(params[:id])
  end

  def update
    @rcustomer = Rcustomer.find(params[:id])
    if @rcustomer.update(rcustomer_params)
      flash[:errors] = "Customer Updated Successfully"
      redirect_to name_preview_business_rcustomer_path(@rcustomer)
    else
      flash[:errors] = @rcustomer.errors.full_messages
      redirect_to edit_business_rcustomer_path
    end
  end

  def name_preview
    @rcustomer = Rcustomer.find(params[:id])
  end

  def delete_customer
    @rcustomer = Rcustomer.find(params[:id])
    if @rcustomer.delete
      flash[:errors] = "Customer Deleted Successfully"
      redirect_to business_rcustomers_path
    else
      flash[:errors] = @rcustomer.errors.full_messages
      redirect_to destroy_business_rcustomer_path
    end
  end

  def search_customer
    if params[:searchParams].blank?
      flash[:errors] = "Enter Valid Data!!"
      redirect_to business_rcustomers_path
    else
      parameter = params[:searchParams].downcase
      @rcustomers = Rcustomer.where("lower(name) LIKE ? ", parameter)
      flash[:errors] = "Customer Searched Successfully"
    end
  end

  private

  def rcustomer_params
    params.require(:rcustomer).permit(:name, :email, :phone_number)
  end
end
