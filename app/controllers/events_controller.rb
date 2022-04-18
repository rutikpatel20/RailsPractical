class EventsController < ApplicationController
  def index
    searchParams = [:filter_search, :product_search]
    if params[:searchParams]
      @events = Event.all
      @events = Event.where("category_id=?",Category.where("category_name = ?",params[:searchParams]).pluck(:id))
    else
      @events = Event.all
    end
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.create(event_params)
    if @event.valid?
      flash[:errors] = "Event Created Successfully"
      redirect_to events_path
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:errors] = "Event Update Successfully"
      redirect_to event_path(@event)
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to edit_event_path
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.delete
      flash[:errors] = "Event Deleted Successfully"
      redirect_to root_path(@event)
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to destroy_event_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :event_date, :user_id, :category_id)
  end
end
