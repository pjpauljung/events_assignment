class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:interested_events,
                                                 :comments).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@events.where.not(location_latitude: nil)) do |event, marker|
      marker.lat event.location_latitude
      marker.lng event.location_longitude
      marker.infowindow "<h5><a href='/events/#{event.id}'>#{event.event_name}</a></h5><small>#{event.location_formatted_address}</small>"
    end
  end

  # GET /events/1
  def show
    @comment = Comment.new
    @rsvp = Rsvp.new
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:event_name, :event_start, :event_end,
                                  :location, :host, :details)
  end
end
