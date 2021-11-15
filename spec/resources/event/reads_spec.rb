require "rails_helper"

RSpec.describe EventResource, type: :resource do
  describe "serialization" do
    let!(:event) { create(:event) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(event.id)
      expect(data.jsonapi_type).to eq("events")
    end
  end

  describe "filtering" do
    let!(:event1) { create(:event) }
    let!(:event2) { create(:event) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: event2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([event2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:event1) { create(:event) }
      let!(:event2) { create(:event) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      event1.id,
                                      event2.id,
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
                                      event2.id,
                                      event1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
