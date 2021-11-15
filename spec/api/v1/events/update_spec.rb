require "rails_helper"

RSpec.describe "events#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/events/#{event.id}", payload
  end

  describe "basic update" do
    let!(:event) { create(:event) }

    let(:payload) do
      {
        data: {
          id: event.id.to_s,
          type: "events",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(EventResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { event.reload.attributes }
    end
  end
end
