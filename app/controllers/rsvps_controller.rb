class RsvpsController < ApplicationController
  before_action :current_user_must_be_rsvp_user, only: [:edit, :update, :destroy] 

  before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

  # GET /rsvps
  def index
    @q = current_user.interested_events.ransack(params[:q])
    @rsvps = @q.result(:distinct => true).includes(:event, :user).page(params[:page]).per(10)
  end

  # GET /rsvps/1
  def show
  end

  # GET /rsvps/new
  def new
    @rsvp = Rsvp.new
  end

  # GET /rsvps/1/edit
  def edit
  end

  # POST /rsvps
  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      message = 'Rsvp was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @rsvp, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /rsvps/1
  def update
    if @rsvp.update(rsvp_params)
      redirect_to @rsvp, notice: 'Rsvp was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rsvps/1
  def destroy
    @rsvp.destroy
    message = "Rsvp was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to rsvps_url, notice: message
    end
  end


  private

  def current_user_must_be_rsvp_user
    set_rsvp
    unless current_user == @rsvp.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rsvp_params
      params.require(:rsvp).permit(:user_id, :event_id, :rsvp_selection)
    end
end
