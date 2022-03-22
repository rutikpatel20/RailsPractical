class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
  end

  def new
    @faculty = Faculty.new
  end

  def create
    @faculty = Faculty.create(faculty_params)
    if @faculty.valid?
      flash[:errors] = "Faculty Added Successfully"
      redirect_to faculties_path
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to new_faculty_path
    end
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update(faculty_params)
      flash[:errors] = "Faculty Updated Successfully"
      redirect_to faculty_path(@faculty)
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to edit_faculty_path(@faculty)
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    if @faculty.delete
      flash[:errors] = "Faculty Successfully Deleted"
      redirect_to root_path(@faculty)
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to destroy_faculty_path
    end
  end

  private
  def faculty_params
    params.require(:faculty).permit(:firstname, :lastname, :phone_number, :email, :birthdate, :department, :designation)
  end
end
