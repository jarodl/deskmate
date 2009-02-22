class LineItemController < ApplicationController
  def list
    @line_items = LineItem.find(:all)
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.new(params[:line_item])
    if @line_item.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update_attributes(params[:line_item])
      redirect_to :action => 'show', :id => @line_item
    else
      render :action => 'edit'
    end
  end

  def delete
    LineItem.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
