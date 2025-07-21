class Api::AuthController < ApplicationController
  def login
    token = request.headers["Authorization"]&.split(" ")&.last

    if token.blank?
      return render json: { error: "Missing ID token" }, status: :unauthorized
    end

    begin
      # Verify Firebase token with FirebaseVerifier.rb
      decoded_token = FirebaseVerifier.verify(token)

      if decoded_token.nil?
        return render json: { error: "Invalid token" }, status: :unauthorized
      end

      firebase_uid = decoded_token["user_id"]
      email = decoded_token["email"]
      name = decoded_token["name"] || ""

      # Find or create user in DB
      user = User.find_or_create_by!(firebase_uid: firebase_uid) do |u|
        u.email = email
        u.first_name = name.split(" ").first
        u.last_name = name.split(" ").last
        u.username = email.split("@").first
        u.user_role = "customer" # default role
      end

      render json: {
        id: user.id,
        email: user.email,
        name: "#{user.first_name} #{user.last_name}",
        role: user.user_role
      }

    rescue => e
      Rails.logger.error("Firebase verification failed: #{e.message}")
      render json: { error: "Invalid token" }, status: :unauthorized
    end
  end
end
