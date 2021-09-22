class UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
 end

 def index
  @book = Book.new
  @users = User.all
  @user = User.new
 end

 def edit
  @user = User.find(params[:id])
  # @userがログインしている人じゃないなら
  # f @user != current_user
  unless @user == current_user
    redirect_to user_path(current_user.id)
  end
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   flash[:notice] = "You have updated user successfully."
   redirect_to user_path(@user.id)
  else
   render "edit"
  end
 end

 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

