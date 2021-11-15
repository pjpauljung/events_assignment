class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:interested_events,
                                                 :comments).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@events.where.not(location_latitude: nil)) do |event, marker|
      marker.lat event.location_latitude
      marker.lng event.location_longitude
    end
  end

  def show
    @comment = Comment.new
    @rsvp = Rsvp.new
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_name, :event_start, :event_end,
                                  :location, :host, :details)
  end
end
