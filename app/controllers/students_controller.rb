class StudentsController < ApplicationController
    
  def index
    @students = Student.search(params[:search], params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
  
  def search
    @results = Student.find(:all, :conditions => ['room LIKE ?', "%#{params[:search]}%"])
  end
  
  def show
    @student = Student.find(params[:id])
    @guests = Guest.find_by_student_id(@student.id)
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid student #{params[:id]}")
    flash[:notice] = "Invalid student"
    redirect_to :action => 'index'
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(params[:student])
    
    if @student.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to :action => 'show', :id => @student
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to :action => 'index'
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to delete invalid student #{params[:id]}")
    flash[:notice] = "Invalid student"
    redirect_to :action => 'index'
  end
end
