class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author= Author.create(params.require(:author).permit(:firstname, :lastname, :dob, :email))
    if @author.valid?
      flash[:notice] = "Author Added!"
      redirect_to authors_path
    else
      flash[:errors] = @author.errors.full_messages
      redirect_to new_author_path
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:firstname, :lastname, :dob, :email))
      flash[:notice]="Updated!"
      redirect_to author_path(@author)
    else
      flash[:errors]=@author.errors.full_messages
      redirect_to edit_author_path(@author)
    end
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.delete
      flash[:notice]="Author Deleted!"
      redirect_to root_path(@author)
    else
      flash[:errors]=@author.errors.full_messages
      redirect_to destroy_author_path
    end
  end
end
