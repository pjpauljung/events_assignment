require "rails_helper"

RSpec.describe "rsvps#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rsvps/#{rsvp.id}", params: params
  end

  describe "basic fetch" do
    let!(:rsvp) { create(:rsvp) }

    it "works" do
      expect(RsvpResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("rsvps")
      expect(d.id).to eq(rsvp.id)
    end
  end
end
