require 'spec_helper'

describe Api::EventsController do

  login_user

  describe "GET #index" do

    context "without a nested user" do

      before do
        create(:rebroadcast)
        create(:livestream)

        get :index, format: :json
        @json_event = JSON.parse(response.body)
      end

      it "returns success code" do
        expect(response.status).to be(200)
      end

      it "returns correct content type" do
        expect(response.header['Content-Type']).to include("application/json")
      end

      it "returns JSON" do
        expect(@json_event.size).to eq(2)
      end

    end

    context "nested into users" do

      before do
        user = create(:user)

        #unrelated events for the user
        create(:rebroadcast)
        create(:livestream)

        create(:rebroadcast, user: user)
        create(:livestream, user: user)

        get :index, user_id: user.id, format: :json
        @json_event = JSON.parse(response.body)
      end

      it "returns success code" do
        expect(response.status).to be(200)
      end

      it "returns correct content type" do
        expect(response.header['Content-Type']).to include("application/json")
      end

      it "returns JSON" do
        expect(@json_event.size).to eq(2)
      end

    end
  end

  describe "GET #show" do

    before(:each) do
      @livestream = create(:livestream)
      get :show, id: @livestream.id, format: :json
      @json_event = JSON.parse(response.body)
    end

    it "returns a success code" do
      expect(response.status).to eq(200)
    end

    it "returns the correct JSON structure" do
      expect(@json_event["id"]).to eq(@livestream.id)
      expect(@json_event["type"]).to eq(@livestream.type_name)
      expect(@json_event["created_at"]).to eq(@livestream.created_at.to_s(:api))
    end

    it "embeds the user" do
      user = @livestream.user
      user_data = @json_event["user"]
      expect(user_data["id"]).to eq(user.id)
      expect(user_data["name"]).to eq(user.name)
    end

    it "embeds the stream" do
      stream = @livestream.stream
      stream_data = @json_event["stream"]
      expect(stream_data["id"]).to eq(stream.to_param)
      expect(stream_data["title"]).to eq(stream.title)
    end

  end

end
