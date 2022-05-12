class JsUsersController < ApplicationController
  before_action :set_user_params, only: [:show, :edit, :update, :destroy]

  def index
    @js_users = JsUser.all
  end

  def new
    @js_user = JsUser.new
  end

  def create
    @js_user = JsUser.create(user_params)
    if @js_user.save
      flash[:errors] = "User Created Sucesssfully"
      redirect_to js_users_path
    else
      flash[:errors] = @js_user.errors.full_messages
      redirect_to new_js_user_path
    end
  end

  def edit
  end

  def show
  end

  def update
    if @js_user.update(user_params)
      flash[:errors] = "User Updated Successfully"
      redirect_to js_user_path(@js_user)
    else
      flash[:errors] = @js_user.errors.full_messages
      redirect_to edit_js_user_path
    end
  end

  def destroy
    if @js_user.delete
      flash[:errors] = "User Deleted Successfully"
      redirect_to root_path
    else
      flash[:errors] = @js_user.errors.full_messages
      redirect_to destroy_js_user_path
    end
  end

  def profile
    @js_user = JsUser.find(params[:id])
  end

  def profile_update
    @js_user = JsUser.find(params[:id])
    respond_to do |format|
      if @js_user.update(user_params)
        flash[:notice] = "User Updated Successfully"
      else
        flash[:errors] = @js_user.errors.full_messages
      end
      format.js
    end
  end

  def changepassword
    @pwd = JsUser.find(params[:id])
  end

  def changepassword_update
    @user = JsUser.find(params[:id])
    if @user.update_attribute(:password, params[:new_password])
      flash[:notice] = "Password updated successfully"
      redirect_to js_user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to changepassword_js_user_path(@user)
    end
  end

  private

  def set_user_params
    @js_user = JsUser.find(params[:id])
  end

  def user_params
    params.require(:js_user).permit(:first_name, :last_name, :email, :password, :subscription, :subscription_email)
  end
end
