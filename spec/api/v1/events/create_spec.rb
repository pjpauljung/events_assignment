require 'rails_helper'

RSpec.describe "events#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/events", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'events',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(EventResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Event.count }.by(1)
    end
  end
end
