class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:upvote, :downvote]

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path, notice: 'The link was successfully added. Thank you!'
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to root_path, notice: "Thank you for your vote!"
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to root_path, notice: "Thank you for your vote!"
  end

  private

  def link_params
    params.require(:link).permit(:url, :topic, :info)
  end

end
