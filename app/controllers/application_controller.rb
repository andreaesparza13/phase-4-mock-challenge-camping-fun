class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  private

  def record_invalid(err)
    render json: { error: err.record.errors.full_messages }, status: :unprocessable_entity
  end

  def record_not_found(err)
    render json: { error: err.message }, status: :not_found
  end

end
