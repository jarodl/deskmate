class SiteController < ApplicationController
  def index
  end
  
  def list_recent_guests
    @guests = Guest.find()
  end
  
  def list_recent_students
  end
  
end
