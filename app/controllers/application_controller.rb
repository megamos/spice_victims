class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

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
    @deceased = Victim.where( category: 'deceased' ).count
    @hospitalized = Victim.where( category: 'hospitalized' ).count
  end

end
