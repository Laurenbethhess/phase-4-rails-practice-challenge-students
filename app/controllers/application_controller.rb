class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

def render_not_found
    render json: { error: "Item not found "}, status: :not_found
end

def render_invalid(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
end
end
