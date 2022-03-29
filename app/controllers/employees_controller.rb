class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    if params[:search_query]
      if Employee.find_by("email = ?",params[:search_query])
        flash[:notice]="Entered Email is already present"
      else
        flash[:notice]="Entered Email is not already present"
      end
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_create_by(employee_params)
    if @employee.valid?
      flash[:errors] = "Employee Created Successfully"
      redirect_to employees_path
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:errors] = "Employee Updated Successfully"
      redirect_to employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.delete
      flash[:errors] = "Employee Deleted Successfully"
      redirect_to root_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to destroy_employee_path
    end
  end

  def task
  end

  def increaseOrder
    Employee.find_in_batches(start: 1, finish: 10) do |emp|
      emp.each do |e|
        e.no_of_order += 1
        e.save
      end
      redirect_to employees_path(@employee)
    end
  end

  def decreaseOrder
    Employee.find_in_batches(start: 1, finish: 10) do |emp|
      emp.each do |e|
        e.no_of_order -= 1
        e.save
      end
      redirect_to employees_path(@employee)
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:firstname, :lastname, :email, :age, :no_of_order, :full_time_available, :salary)
  end

end
