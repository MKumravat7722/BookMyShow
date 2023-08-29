class ShowsController < ApplicationController
  skip_before_action :check_customer
  
  def index 
    render json: Show.all  
  end

  def create 
    show = Show.new(show_params)
    if show.save
      render json: show
    else
      render json: show.errors.full_messages
    end 
  end
  
  def update
    if @show.update(show_params) 
      render json: @show
    else
      @show.errors.full_messages
    end 
  end

  def destroy
    if @show.destroy
      rander json: {message:"Show Deleted Succesfull"}
    end 
  end
  private
  
  def set_show
    @show=Show.find_by(params[:id])
  end
  
  def show_params
    params.require(:show).permit(
      :movie_id,
      :screen_id
    )
  end
end
