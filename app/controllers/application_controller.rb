class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :victims_count

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_NAME"] && password == ENV["ADMIN_PASSWORD"]
    end
  end

  private

  def victims_count
    @count = Victim.count
  end

end
