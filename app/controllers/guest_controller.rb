class GuestController < ApplicationController
  def list
    @guests = Guest.find(:all)
  end
  
  def show
    @guest = Guest.find(params[:id])
  end
  
  def new
    @guest = Guest.new
  end
  
  def create
    @guest = Guest.new(params[:guest])
    @student = Student.find_by_name(params[:parent_name])
    if @guest.save
      @guest.parent_id = @student.id
      redirect_to :action => 'list'
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
  
  def delete
    Guest.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
end