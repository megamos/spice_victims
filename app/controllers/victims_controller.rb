class VictimsController < ApplicationController
  before_action :set_victim, only: [:show, :edit, :update, :destroy]
  # basic http authentication for admins
  before_action :authenticate, only: [:edit, :update, :destroy]

  def index
    @victims = Victim.all
    @links = Link.all
    victims_count
    victims_latest
    links_new
    links_video
  end

  def show
  end

  def new
    @victim = Victim.new
  end

  def edit
  end

  def create
    @victim = Victim.new(victim_params)
    if @victim.save
      redirect_to victims_path, notice: 'Victim was successfully created. Thank you!'
    else
      render :new
    end
  end

  def update
    if @victim.update(victim_params)
      redirect_to admin_path, notice: 'Victim was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @victim.destroy
    redirect_to admin_path, notice: 'Victim was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_victim
      @victim = Victim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def victim_params
      params.require(:victim).permit(:name, :age, :country, :city, :link, :info, :category)
    end

    def victims_latest
      @victims_latest = @victims.reorder('created_at').take(10)
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
