require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do

  before :each do
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(ENV['ADMIN_NAME'],ENV['ADMIN_PASSWORD'])
  end

  describe "GET 'index'" do
    it "should be successful with proper ceredentials" do
      get 'index'
      expect(response).to be_success
    end
  end

end
