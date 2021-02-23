require 'rails_helper'

RSpec.describe Link, type: :model do
  # let(:links) { FactoryBot.build(:link) }

  describe Link do
    it "has a valid factory" do
      expect(FactoryBot.build(:link)).to be_valid
    end

    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:slug) }
  end
end
