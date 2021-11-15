require "rails_helper"

RSpec.describe "rsvps#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/rsvps/#{rsvp.id}", payload
  end

  describe "basic update" do
    let!(:rsvp) { create(:rsvp) }

    let(:payload) do
      {
        data: {
          id: rsvp.id.to_s,
          type: "rsvps",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RsvpResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { rsvp.reload.attributes }
    end
  end
end
