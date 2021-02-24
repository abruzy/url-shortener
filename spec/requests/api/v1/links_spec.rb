require "rails_helper"

RSpec.describe "Api::V1::LinksController", type: :request do
  let(:params) { attributes_for(:link) }

  describe "#create" do
    context "when user passes in valid link params" do
      let(:short_url) {
        {
          original_url: params[:original_url],
          slug: params[:slug]
        }.as_json
      }

      it 'should create a short url' do
        post api_v1_links_path, params: params
        expect(json["data"]).to include(short_url)
      end

      it "should increase the size of the links table by 1" do
        expect do
          post api_v1_links_path, params: params
        end.to change(Link, :count).by 1
      end
    end

    context "when invalid params are passed" do
      before do
        params.delete :original_url
        post api_v1_links_path, params: params
      end

      it "returns 422 as the status code" do
        expect(response).to have_http_status 422
      end

      it "returns an error" do
        expect(json["original_url"]).to include("can't be blank")
      end
    end

    context "when slug already exists" do
      before do
        2.times { post api_v1_links_path, params: params }
      end

      it "returns 422 as the status code" do
        expect(response).to have_http_status 422
      end

      it "returns an error" do
        expect(json["slug"]).to include("has already been taken")
      end
    end
  end
end
