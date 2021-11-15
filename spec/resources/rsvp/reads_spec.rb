require "rails_helper"

RSpec.describe RsvpResource, type: :resource do
  describe "serialization" do
    let!(:rsvp) { create(:rsvp) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(rsvp.id)
      expect(data.jsonapi_type).to eq("rsvps")
    end
  end

  describe "filtering" do
    let!(:rsvp1) { create(:rsvp) }
    let!(:rsvp2) { create(:rsvp) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: rsvp2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([rsvp2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:rsvp1) { create(:rsvp) }
      let!(:rsvp2) { create(:rsvp) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      rsvp1.id,
                                      rsvp2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      rsvp2.id,
                                      rsvp1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
