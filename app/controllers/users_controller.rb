class UsersController < ApplicationController
  
  skip_before_action :authenticate_user, except: [:show, :update]  
  skip_before_action :check_customer 
  skip_before_action :check_owner
  def index
    users=User.all
    render json: users
  end
  def show
    render json: @current_user
  end
  def create
    user = User.new(user_params)
    if user.save 
       render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages}, status: :unprocessable_entity   
    end 
  end
   
  def update
    if @current_user.update(user_params)
      render json: @current_user
    else
      render json: @current_user.errors.full_messages
    end
  end
  def user_params
    params.permit(
      :name,
      :user_name,
      :email,
      :password,
      :image,
      :type
    )
  end
end
 