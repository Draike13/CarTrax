class Api::UsersController < ApplicationController
  before_action :authorize_request
  before_action :authorize_admin!, only: [ :index ]


  def index
    role = params[:role]
    if role.present?
      users = User.where(user_role: role)
      render json: users
    else
      render json: { error: "Role is required" }, status: :bad_request
    end
  end

  def show
    render json: current_user
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def current_user
    # You can move this to ApplicationController to reuse it
    token = request.headers["Authorization"]&.split(" ")&.last
    decoded = FirebaseVerifier.verify(token)
    @current_user ||= User.find_by(firebase_uid: decoded["user_id"])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone)
  end
end
