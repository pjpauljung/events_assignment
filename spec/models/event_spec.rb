require "rails_helper"

RSpec.describe Event, type: :model do
  describe "Direct Associations" do
    it { should have_many(:comments) }

    it { should have_many(:interested_events) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
