class UsersController < ApplicationController


  def show
    @user= User.find(params[:id])
    @books= @user.books
  end

  def index
    @user=current_user

    @users = User.all

  end

  def edit
    @user = User.find(params[:id])

    redirect_to user_path(current_user.id) unless @user == current_user


  end



  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      #flash[:notice]="error"
      render :edit
    end
  end

   private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)

  end



end