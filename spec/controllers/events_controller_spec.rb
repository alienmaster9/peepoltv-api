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

end
