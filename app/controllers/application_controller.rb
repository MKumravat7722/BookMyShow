class ApplicationController < ActionController::API
  include JwtToken
  before_action :authenticate_user
  before_action :check_customer
  before_action :check_owner
  
  before_action do
    ActiveStorage::Current.host = request.base_url
  end
  
  private
  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header  
    begin
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e  
      render json: { error: e.message }, status: :unauthorized 
    end
  end
  
  def check_owner
    return render json: {message: "User not an Owner"} unless @current_user.owner?
  end
  
  def check_customer
    return render json: {message: "User not an Customer"} unless @current_user.customer?
  end
  
  rescue_from ActiveRecord::RecordNotFound, with: :handle_exception
  
  def handle_exception
    render json: { error: 'ID not found' }
  end
end
