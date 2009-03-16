class GuestsController < ApplicationController
      
  def index
    @guests = Guest.find(:all)
  end
  
  def show
    @guest = Guest.find(params[:id])
  end
  
  def new
    @guest = Guest.new
  end
  
  def create
    @student = Student.find_by_name(params[:guest][:student_name])
    
    if @student.nil?
      flash[:notice] = "#{params[:guest][:student_name]} was not found."
      redirect_to :action => :new
    else
      @student.num_of_guests += 1
      @student.save
      @guest = Guest.new(params[:guest])
      @guest.student_id = @student.id
      if @guest.save
        redirect_to :action => 'index'
      else
        render :action => 'new'
      end
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
    @guest = Guest.find(params[:id])
    @student = Student.find_by_id(@guest.student_id)
    @student.num_of_guests -= 1
    @student.save
    @guest.destroy
    redirect_to :action => 'index'
  end
end
