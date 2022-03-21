class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(params.require(:student).permit(:firstname, :lastname, :phone_number, :email, :birthdate, :department, :terms_of_usage))
    if @student.valid?
      flash[:notice] = "Student Added Successfully"
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(params.require(:student).permit(:firstname, :lastname, :phone_number, :email, :birthdate, :department, :terms_of_usage))
      flash[:notice] = "Student Updated Successfully"
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.delete
      flash[:notice] = "Student Deleted Successfully"
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to destroy_student_path
    end
  end
end
