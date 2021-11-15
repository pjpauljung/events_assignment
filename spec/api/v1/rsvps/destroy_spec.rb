require 'rails_helper'

RSpec.describe "rsvps#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/rsvps/#{rsvp.id}"
  end

  describe 'basic destroy' do
    let!(:rsvp) { create(:rsvp) }

    it 'updates the resource' do
      expect(RsvpResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Rsvp.count }.by(-1)
      expect { rsvp.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
