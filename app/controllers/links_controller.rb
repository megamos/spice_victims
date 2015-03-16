class LinksController < ApplicationController
  # devise authentication that requires user to be registered
  before_action :authenticate_user!, only: [:upvote, :downvote]
  # basic http authentication for admins
  before_action :authenticate, only: [:edit, :update, :destroy]

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
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
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to admin_path, notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to admin_path, notice: 'Link was successfully destroyed.'
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
