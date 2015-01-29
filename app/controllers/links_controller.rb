class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to root_path, notice: 'The link was successfully added. Thank you!'}
      else
        format.html { render :new}
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def link_params
      params.require(:url).permit(:topic,:info)
    end
end
