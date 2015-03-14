module AuthHelper
  def http_login
    name = 'admin'
    password = 'admin'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(name,password)
  end
end
