class AdminController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end
  
  def list
    
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

end
