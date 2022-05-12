class Product2sController < ApplicationController
  before_action :set_product_params, only: [:show, :edit, :update, :destroy]
  before_action :user_authentication

  def index
    @product2s = Product2.all
  end

  def new
    @product2 = Product2.new
  end

  def create
    @product2 = Product2.new(product2_params)
    if @product2.save
      flash[:errors] = "Product Created successfully"
      redirect_to product2s_path
    else
      flash[:errors] = @product2.errors.full_messages
      redirect_to new_product2_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product2.update(product2_params)
      flash[:errors] = "Product Update Successfully"
      redirect_to product2_path(@product2)
    else
      flash[:errors] = @product2.errors.full_messages
      redirect_to edit_product2_path
    end
  end

  def destroy
    @product2.destroy
    redirect_to product2s_path
  end

  private

  def set_product_params
    @product2 = Product2.find(params[:id])
  end

  def product2_params
    params.require(:product2).permit(:product_name, :price, :description, :user1_id)
  end

  def user_authentication
    if !current_user1
      flash[:notice] = "Before action, Please login or sign up!"
      redirect_to root_path
    end
  end
end
