class Admin::DashboardController < ApplicationController
  before_action :authenticate

  def index
    @victims = Victim.all
    @links = Link.all
  end

end
