require 'spec_helper'

describe Livestream do
  it "has a valid factory" do
    livestream = build(:livestream)
    expect(livestream).to be_valid
  end

  describe "Methods" do
    describe "#type_name" do
      it "returns the correct type" do
        livestream = create(:livestream)
        expect(livestream.type_name).to eq("livestream")
      end
    end
  end
end
