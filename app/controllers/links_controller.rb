class LinksController < ApplicationController
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

  private
    def link_params
      params.require(:link).permit(:url,:topic, :info)
    end
end
