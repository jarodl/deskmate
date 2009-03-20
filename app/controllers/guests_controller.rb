class GuestsController < ApplicationController
      
  def index
    @guests = Guest.search(params[:search], params[:page])
  end
  
  def show
    @guest = Guest.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid guest #{params[:id]}")
    flash[:notice] = "Invalid guest"
    redirect_to :action => 'index'
  end
  
  def new
    @guest = Guest.new
  end
  
  def create
    @guest = Guest.new(params[:guest])
    if @guest.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @guest = Guest.find(params[:id])
  end
  
  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(params[:guest])
      redirect_to :action => 'show', :id => @guest
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to :action => 'index'
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to delete invalid guest #{params[:id]}")
    flash[:notice] = "Invalid guest"
    redirect_to :action => 'index'
  end
  
end
