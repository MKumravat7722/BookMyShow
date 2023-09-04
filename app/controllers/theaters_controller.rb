class TheatersController < ApplicationController
before_action :set_value ,only: [:update, :destroy,:show]
skip_before_action :check_customer 

def index
    theater=@current_user.theaters
    render json: theater
end

def show 
  render json: @theater
end

def create 
  theater=@current_user.theaters.new(theater_params)
  if theater.save
    render json: theater
  else
    render json:{errors: theater.errors.full_messages}
  end
end

def update
  if @theater.update(theater_params)
    render json: @theater
  else
    @theater.errors.full_messages
  end
end

def destroy
  if @theater.destroy
    render json: {message: "Theater deleted SuccesFull"}
  else
    render json: @theater.errors.full_messages
  end
end

def theater_params
    params.require(:theater).permit(:name, :location, screens_attributes: [:screen_name, :capacity])
end
def set_value
  @theater=@current_user.theaters.find(params[:id])
end
end
