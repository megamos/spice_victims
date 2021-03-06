class VictimsController < ApplicationController
  # devise authentication that requires user to be registered
  before_action :authenticate_user!, only: [:new]
  # basic http authentication for admins
  before_action :authenticate, only: [:edit, :update, :destroy]
  before_action :set_victim, only: [:show, :edit, :update, :destroy]

  def index
    @victims = Victim.paginate(:page => params[:page])
    @links = Link.paginate(:page => params[:page])
    
    @links_new = Link.reorder( 'created_at' ).take(3)
    @links_video = Link.where( category: "video" ).paginate(:page => params[:page], :per_page => 6 )
    gon.victims_latest = Victim.reorder('created_at').take(10)
    
    victims_count
    
  end

  def show
  end

  def charts
    @victims = Victim.all
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
end
