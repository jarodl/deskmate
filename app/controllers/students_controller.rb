class StudentsController < ApplicationController
  def index
    @students = Student.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def show
    @student = Student.find(params[:id])
    @guests = Guest.find_by_student_id(@student.id)
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
  
  def delete
    Student.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
