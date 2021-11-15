class Api::V1::RsvpsController < Api::V1::GraphitiController
  def index
    rsvps = RsvpResource.all(params)
    respond_with(rsvps)
  end

  def show
    rsvp = RsvpResource.find(params)
    respond_with(rsvp)
  end

  def create
    rsvp = RsvpResource.build(params)

    if rsvp.save
      render jsonapi: rsvp, status: :created
    else
      render jsonapi_errors: rsvp
    end
  end

  def update
    rsvp = RsvpResource.find(params)

    if rsvp.update_attributes
      render jsonapi: rsvp
    else
      render jsonapi_errors: rsvp
    end
  end

  def destroy
    rsvp = RsvpResource.find(params)

    if rsvp.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: rsvp
    end
  end
end
