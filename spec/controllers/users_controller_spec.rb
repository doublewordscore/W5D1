require 'rails_helper'
require 'spec_helper'


RSpec.describe UsersController, :type => :controller do

  subject!(:user) do
    FactoryGirl.create(:user,
     id: 1)
  end

  describe "GET #new" do
    it "renders the new user page" do
      get :new, user: {}

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "renders the user show page" do
      get :show, id: 1

      expect(response).to render_template("show")
      expect(response).to have_http_status(200)

    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {username: "Hillary Clinton", password: "cat"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to user show page" do
        post :create, user: {username: "Hillary Clinton", password: "president"}
        expect(response).to redirect_to(user_url(User.last.id))
      end
    end

  end



end
