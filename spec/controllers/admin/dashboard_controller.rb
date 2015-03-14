require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  include AuthHelper

  before(:each) do
    http_login
  end

  describe "GET 'index'" do
    it "should be successful with proper ceredentials" do
      get 'index'
      expect(response).to be_success
    end
  end

end
