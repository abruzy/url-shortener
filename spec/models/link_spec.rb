require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:short_url) { FactoryBot.build(:link) }

  describe "has a valid params" do
    it "has a valid factory" do
      expect(short_url).to be_valid
    end
  end

  describe "presence validations" do
    it { should validate_presence_of(:original_url) }
  end

  describe "uniqueness validations" do
    it { should validate_uniqueness_of(:slug).ignoring_case_sensitivity }
  end

  describe "url regex" do
    context "when a valid url is passed" do
      it "returns a valid object" do
        short_url.original_url = "https://abubakardiallo.com"
        expect(short_url).to be_valid
      end
    end

    context "when an invalid url is passed" do
      it "returns an invalid object" do
        short_url.original_url = "abubakardiallo"
        expect(short_url).to_not be_valid
      end
    end
  end
end
