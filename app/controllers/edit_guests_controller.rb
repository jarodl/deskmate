class EditGuestsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @guest_pages, @guests = paginate :guests, :per_page => 10
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])
    if @guest.save
      flash[:notice] = 'Guest was successfully created.'
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
      flash[:notice] = 'Guest was successfully updated.'
      redirect_to :action => 'show', :id => @guest
    else
      render :action => 'edit'
    end
  end

  def destroy
    Guest.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
