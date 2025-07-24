class ApplicationController < ActionController::API
  attr_reader :current_user

  protected

  def authorize_request
    token = request.headers["Authorization"]&.split(" ")&.last

    if token.blank?
      return render json: { error: "Missing token" }, status: :unauthorized
    end

    decoded = FirebaseVerifier.verify(token)

    if decoded.nil?
      return render json: { error: "Invalid token" }, status: :unauthorized
    end

    @current_user = User.find_by(firebase_uid: decoded["user_id"])

    unless @current_user
      render json: { error: "User not found" }, status: :unauthorized
    end
  end

  def authorize_admin!
    authorize_request
    unless current_user&.user_role == "admin"
      render json: { error: "Forbidden: Admins only" }, status: :forbidden
    end
  end
end
