require 'spec_helper'

describe Rebroadcast do

  it "has a valid factory" do
    rebroadcast = build(:rebroadcast)
    expect(rebroadcast).to be_valid
  end

  describe "Methods" do
    describe "#type_name" do
      it "returns the correct type" do
        rebroadcast = create(:rebroadcast)
        expect(rebroadcast.type_name).to eq("rebroadcast")
      end
    end
  end
end
