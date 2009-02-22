class MainController < ApplicationController

  def index
    @students = Student.find_students_signed_in
  end
  
  def list
    @guest_pages, @guests = paginate :guests, :per_page => 10
  end

  def show
    @student = Student.find(params[:studentid])
  end
  
  def search
    query = params[:q]
    @student = Student.find(:all, :conditions => ["studentid = ?", query])
  end
  
end
