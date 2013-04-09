require 'spec_helper'

describe Channel do

  it "has a valid factory" do 
    channel = FactoryGirl.build(:channel)
    expect(channel).to be_valid
  end

  context "validations" do
    it "requires an identifier" do
      channel = FactoryGirl.build(:channel, identifier: '')
      expect(channel).to be_invalid
    end
  end

  context "creating channels" do
    let(:channel) { FactoryGirl.create(:channel) }

    it "assigns a new MD5 for the ID" do
      expect(channel.id).to match(/^[a-zA-Z0-9]{32}$/)
    end
  end


end