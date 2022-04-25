class Employee1sController < ApplicationController
  def index
    @employee1s = Employee1.all
  end

  def new
    @employee1 = Employee1.new
    1.times { @employee1.address1s.build }
  end

  def create
    @employee1 = Employee1.create(employee1_params)
    if @employee1.valid?
      flash[:errors] = "Employee Created Successfully"
      redirect_to employee1s_path
    else
      flash[:errors] = @employee1.errors.full_messages
      render :new
    end
  end

  def show
    @employee1 = Employee1.find(params[:id])
  end

  def edit
    @employee1 = Employee1.find(params[:id])
  end

  def update
    @employee1 = Employee1.find(params[:id])
    if @employee1.update(employee1_params)
      flash[:errors] = "Employee Updated Successfully"
      redirect_to employee1_path(@employee1)
    else
      flash[:errors] = @employee1.errors.full_messages
      redirect_to edit_employee1_path
    end
  end

  def destroy
    @employee1 = Employee1.find(params[:id])
    if @employee1.delete
      flash[:errors] = "Employee Deleted Successfully"
      redirect_to root_path(@employee1)
    else
      flash[:errors] = @employee1.errors.full_messages
      redirect_to destroy_employee1_path
    end
  end

  def search
    if params[:searchParams].blank?
      flash[:errors] = "Enter Valid Data!!"
      redirect_to search_path
    else
      parameter = params[:searchParams].downcase
      @employee1s = Employee1.where("lower(employee_name) LIKE ? ", parameter)
      flash[:errors] = "Employee Searched Successfully"
    end
  end

  private

  def employee1_params
    params.require(:employee1).permit(:employee_name, :email, :password, :address, :gender, { hobbies: [] }, :mobile_number, :birth_date, :document, address1s_attributes: [:house_name, :street_name, :road])
  end
end
