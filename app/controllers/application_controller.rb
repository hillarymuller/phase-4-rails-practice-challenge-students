class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
private
def render_not_found
    render json: { error: "not found" }, status: :not_found
end
def unprocessable_entity(invalid)
    render json: { error: invalid.record.errors }, status: :unprocessable_entity
end
end
