class EventsController < ApplicationController

  def index
    @events = Event.rank(:row_order).all
  end

  def show
    @event = Event.find(params[:id])
  end

end
