class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_address
  end
  
  def create
    @user = User.new(user_params)   
    if @user.save
      # stores saved user id in a session
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render :new
    end
  end

  def enroll_event
    @user = User.find_by(id: session[:user_id])
    if session[:user_id] && params[:event_id]
      Enrollment.create(user_id:session[:user_id],event_id:params[:event_id])
      redirect_to user_path(@current_user.id)
    end
  end
  
  def unenroll_event
    Enrollment.delete_by("user_id=? and event_id=?",@current_user.id,params[:event_id])
    redirect_to events_path
  end
  
  def post_user
    @enroll=Enrollment.create(enrollment_params)
    if @enroll.valid?
      flash[:errors] = "Event Enrolled Successfully"
      redirect_to events_path
    else
      flash[:errors] = "Event is not Enrolled"
      redirect_to events_path
    end
  end

  def userprofile
    @user = @current_user
    @events = Event.all
  end

  private
  def user_params
    # strong parameters
    params.require(:user).permit(:email, :username, :password, :password_confirmation, address_attributes: [:user_address])
  end

  def enrollment_params
    params.require(:enrollment).permit(:user_id, :event_id)
  end
  
end
