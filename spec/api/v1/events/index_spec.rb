require 'rails_helper'

RSpec.describe "events#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/events", params: params
  end

  describe 'basic fetch' do
    let!(:event1) { create(:event) }
    let!(:event2) { create(:event) }

    it 'works' do
      expect(EventResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['events'])
      expect(d.map(&:id)).to match_array([event1.id, event2.id])
    end
  end
end
