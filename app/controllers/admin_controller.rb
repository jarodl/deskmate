class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => 'index' })
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end
  
  def logout
    session[:user_id] = :logged_out
    flash[:notice] = "Logged out"
    redirect_to(:action => 'login')
  end
  
  def index
    @total_guests = Guest.count
  end
  
  def list_students
    @students = Student.paginate :per_page => 10, :page => params[:page],
                      :conditions => ['name LIKE ? OR student_id LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"],
                      :order => 'name'
  end
  
  def list_guests
    @guests = Guest.paginate :per_page => 10, :page => params[:page],
                             :conditions => ['name LIKE ?', "%#{params[:search]}%"],
                             :order => 'name'
  end

end
