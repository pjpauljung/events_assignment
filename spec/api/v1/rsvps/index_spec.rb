require 'rails_helper'

RSpec.describe "rsvps#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rsvps", params: params
  end

  describe 'basic fetch' do
    let!(:rsvp1) { create(:rsvp) }
    let!(:rsvp2) { create(:rsvp) }

    it 'works' do
      expect(RsvpResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['rsvps'])
      expect(d.map(&:id)).to match_array([rsvp1.id, rsvp2.id])
    end
  end
end
