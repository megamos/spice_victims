def authorize_admin
  request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(ENV['ADMIN_NAME'],ENV['ADMIN_PASSWORD'])
end
