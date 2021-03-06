class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.valid?
      flash[:errors] = "Student Added Successfully"
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
    if @student.update(student_params)
      flash[:errors] = "Student Updated Successfully"
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.delete
      flash[:errors] = "Student Deleted Successfully"
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to destroy_student_path
    end
  end

  private
  def student_params
    params.require(:student).permit(:firstname, :lastname, :phone_number, :email, :birthdate, :department, :terms_of_usage)
  end

end
