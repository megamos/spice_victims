class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :victims_count

  private

  def victims_count
    @count = Victim.count
  end

  def victims_latest
    @victims_latest = @victims.take(10)
  end

  def links_new
    @links_new = @links.take(3)
  end

  def links_video
    @links_video = @links.take(3)
    #Later replaced by
    #@links_video = Links.sort_by( :category => "video" ).take(3)
  end

end
