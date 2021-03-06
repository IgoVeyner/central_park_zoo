class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :redirect_already_logged_in, only: [:new]
  before_action :redirect_anon_users_to_home, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def edit
    unless helpers.has_access
      flash[:message] = "You do not have access to Edit this User"
      render "partials/error"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def most_donations
    @user = User.most_donations
    unless @user
      flash[:message] = "No donations yet"
      render "partials/error"
    end
  end

  def zookeepers
    @zookeepers = User.zookeepers.order(name: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name, :birthdate, :funds, :admin)
  end

  def find_user
    @user = User.find_by_id(params[:id])
    render_error(params[:id], User.name, user_index_path) unless @user
  end
end
