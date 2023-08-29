class TicketsController < ApplicationController
  skip_before_action :check_owner
  def index 
    booking_history=@current_user.tickets 
    if booking_history.presence
      render json: booking_history
    else
      render json: {message: "booking history not available for you"}
    end
  end
  
  def search_tickets
    id=params[:unique_id]
    unless id.presence
      render json: {message: "please give write information"}
      
    end
    ticket=Ticket.find_by(unique_id: params[:unique_id])
    if ticket.presence
      render json: ticket
    else
      render json: {errors: "No ticket prensent for your id"}
    end
  end
  def create
    total_tickets = params[:ticket_purchased].to_i
    show = Show.find(params[:show_id])
  
    if show.nil?
      render json: { message: "Show is not available" }
    elsif show.screen.capacity < total_tickets
      render json: { errors: 'Not enough available seats' }, status: :unprocessable_entity
    else
      t = Ticket.new(ticket_purchased: total_tickets, user: @current_user, show: show)
  
      if t.valid?
        ActiveRecord::Base.transaction do
          t.save
          show.screen.update(capacity: show.screen.capacity - total_tickets)
          render json: { message: "Tickets booked successfully" }
        end
      else
        render json: { errors: t.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

end

