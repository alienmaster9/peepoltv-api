require 'spec_helper'

describe Event do
  it "has a valid factory" do
    event = build(:event)
    expect(event).to be_valid
  end

  describe "Relations" do
    it { should belong_to(:user) }
    it { should belong_to(:stream) }
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:stream_id) }
  end

  describe "Methods" do
    describe "#type_name" do
      it "returns the correct type" do
        event = create(:event)
        expect(event.type_name).to eq("event")
      end
    end

    describe "#by_user" do
      it "filters by user" do
        create(:event)
        create(:event)

        this_user = create(:user)
        event = create(:event, user: this_user)

        events = Event.by_user(this_user.id)
        expect(events.size).to eq(1)
        expect(events).to include(event)
      end
    end
  end
end
