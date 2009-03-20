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
  end
  
  def index
    @total_guests = Guest.count
  end

end
