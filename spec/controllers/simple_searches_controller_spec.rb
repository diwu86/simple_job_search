require "rails_helper"

RSpec.describe SimpleSearchesController, type: :controller do

  describe "GET #index" do
    it "should success with params" do
      get :index, {keywords: "sales", location: "atlanta"}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #create" do
    it "should success with params" do
      post :create, {simple_search: {keywords: "sales", location: "atlanta"}}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      post :create, {simple_search: {keywords: "sales", location: "atlanta"}}
      expect(response).to render_template("index")
    end
  end
end