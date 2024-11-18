class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @book = Book.new
    @users = User.all
  end

  def show
    #@user = User.find(params[:id]) #テスト追加
    @book = Book.new
    @books = @user.books
  end

  def edit
    # @user は set_user メソッドで設定されるので、特に追加は不要
  end

  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def is_matching_login_user
    unless @user == current_user
    redirect_to(user_path(current_user), alert: 'You are not authorized to edit this profile.')
  end
end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end