class User2sController < ApplicationController
  def index
    @user2s = User2.all
  end

  def new
    @user2 = User2.new
  end

  def create
    @user2 = User2.create(user2_params)
    if @user2.valid?
      WelcomeMailMailer.create_mail(@user2).deliver_now
      flash[:errors] = "User Created Successfully"
      redirect_to user2s_path
    else
      flash[:errors] = @user2.errors.full_messages
      redirect_to new_user2_path
    end
  end

  def show
    @user2 = User2.find(params[:id])
  end

  def edit
    @user2 = User2.find(params[:id])
  end

  def update
    @user2 = User2.find(params[:id])
    before_mail = @user2.email
    if @user2.update(user2_params)
      WelcomeMailMailer.with(user2: @user2).update_mail.deliver if before_mail != @user2.email
      flash[:errors] = "User Updated Successfully"
      redirect_to user2_path(@user2)
    else
      flash[:errors] = @user2.errors.full_messages
      redirect_to edit_user2_path
    end
  end

  def destroy
    @user2 = User2.find(params[:id])
    WelcomeMailMailer.delete_mail(@user2).deliver_now
    if @user2.delete
      flash[:errors] = "User Deleted Successfully"
      redirect_to user2s_path
    else
      flash[:errors] = @user2.errors.full_messages
      redirect_to destroy_user2_path
    end
  end

  private

  def user2_params
    params.require(:user2).permit(:name, :email, :picture, :resume)
  end
end
