class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @users = User.all
    render json: @users
  end

  def create
    puts params
    User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password_digest: params[:password_digest])
    @users = User.all
    render json: @users
  end

  def update
    User.update(id: params[:id], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password_digest: params[:password_digest])
    @users = User.all

    render json: @users
  end

  def destroy
    User.destroy(id: params[:id])
    @users = User.all
    render json: @users
  end

end
