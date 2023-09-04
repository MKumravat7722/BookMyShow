class ScreensController < ApplicationController
  skip_before_action :check_customer
  before_action :set_screen ,only: [:update, :destroy] 
  
  def index 
    render json: Screen.all
  end
  
  def update
    if @screen.update(screen_params)
      render json: @screen, status: :ok
    else
      render json: @screen.errors.full_messages
    end
  end
  
  def destroy
    if @screen.destroy
      render json: {message: "Screen Deleted Succusfull"}
    else
      render json: @screen.errors.full_messages
    end
  end
  
  def set_screen
    @screen = @current_user.screens.find(params[:id])
  end
  
  def screen_params 
    params.require(:screen).permit(
      :screen_name,
      :capacity
    )
  end
end
