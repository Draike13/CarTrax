class Api::WorkerRequestsController < ApplicationController
  before_action :set_worker_request, only: [ :update ]
  before_action :authorize_admin!, only: [ :admin_verify ]


  # INDEX /api/worker_requests
  def index
  unless current_user&.user_role == "admin"
    return render json: { error: "Unauthorized" }, status: :unauthorized
  end

  requests = WorkerRequest.all.order(created_at: :desc)
  render json: requests
  end

  # POST /api/worker_requests
  def create
    worker_request = WorkerRequest.new(worker_request_params)
    worker_request.admin_verified = false
    worker_request.worker_verified = false

    if worker_request.save
      render json: worker_request, status: :created
    else
      render json: { errors: worker_request.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/worker_requests/:id
  def update
    if current_user&.user_role == "admin"
      if @worker_request.update(admin_verified: true)
        render json: @worker_request
      else
        render json: { errors: @worker_request.errors.full_messages }, status: :unprocessable_entity
      end
    else
      if @worker_request.admin_verified
        @worker_request.admin_verified = false
      end

      if @worker_request.update(worker_request_params)
        if @worker_request.admin_verified && @worker_request.worker_verified
          create_worker_user_from_request(@worker_request)
        end
        render json: @worker_request
      else
        render json: { errors: @worker_request.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def set_worker_request
    @worker_request = WorkerRequest.find(params[:id])
  end

  def worker_request_params
    params.require(:worker_request).permit(:first_name, :last_name, :email, :phone, :admin_verified, :worker_verified)
  end

  def authorize_admin!
    unless current_user&.user_role == "admin"
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def create_worker_user_from_request(request)
    User.create!(
      first_name: request.first_name,
      last_name: request.last_name,
      email: request.email,
      phone: request.phone,
      username: request.email.split("@").first,
      user_role: "worker",
      firebase_uid: nil # Set once they sign in via Firebase
    )
  end
end
