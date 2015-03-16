class Admin::DashboardController < ApplicationController
  before_action :authenticate

  def index
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_NAME"] && password == ENV["ADMIN_PASSWORD"]
    end
  end
end
