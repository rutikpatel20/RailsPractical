class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category= Category.create(category_params)
    if @category.valid?
      flash[:notice] = "Category Added!"
      redirect_to categories_path
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to new_category_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:errors] = "Category Update Successfully"
      redirect_to category_path(@category)
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to edit_category_path
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.delete
      flash[:errors] = "Category Deleted Successfully"
      redirect_to categories_path
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to destroy_category_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :user_id)
  end
end
