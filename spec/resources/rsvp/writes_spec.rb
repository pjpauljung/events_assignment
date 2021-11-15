require "rails_helper"

RSpec.describe RsvpResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "rsvps",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RsvpResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Rsvp.count }.by(1)
    end
  end

  describe "updating" do
    let!(:rsvp) { create(:rsvp) }

    let(:payload) do
      {
        data: {
          id: rsvp.id.to_s,
          type: "rsvps",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RsvpResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { rsvp.reload.updated_at }
      # .and change { rsvp.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:rsvp) { create(:rsvp) }

    let(:instance) do
      RsvpResource.find(id: rsvp.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Rsvp.count }.by(-1)
    end
  end
end
