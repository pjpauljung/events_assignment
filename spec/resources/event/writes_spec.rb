require 'rails_helper'

RSpec.describe EventResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'events',
          attributes: { }
        }
      }
    end

    let(:instance) do
      EventResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Event.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:event) { create(:event) }

    let(:payload) do
      {
        data: {
          id: event.id.to_s,
          type: 'events',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      EventResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { event.reload.updated_at }
      # .and change { event.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:event) { create(:event) }

    let(:instance) do
      EventResource.find(id: event.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Event.count }.by(-1)
    end
  end
end
