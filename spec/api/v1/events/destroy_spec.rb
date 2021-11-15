require 'rails_helper'

RSpec.describe "events#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/events/#{event.id}"
  end

  describe 'basic destroy' do
    let!(:event) { create(:event) }

    it 'updates the resource' do
      expect(EventResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Event.count }.by(-1)
      expect { event.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
