class StudentController < ApplicationController  
  def list
    @students = Student.find(:all)
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to :action => 'list'
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
