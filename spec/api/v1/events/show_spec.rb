require "rails_helper"

RSpec.describe "events#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/events/#{event.id}", params: params
  end

  describe "basic fetch" do
    let!(:event) { create(:event) }

    it "works" do
      expect(EventResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("events")
      expect(d.id).to eq(event.id)
    end
  end
end
