require 'rails_helper'

RSpec.describe TokensController, type: :controller do
  let(:valid_attributes) {
    { username: 'some_user', password: 'secret_pass' }
  }

  let(:invalid_attributes) {
    { username: 'wrong', password: 'wrong' }
  }

  let(:valid_session) { {} }

  let(:json) { JSON.parse(response.body).symbolize_keys }

  describe "POST #create" do
    context "with valid params" do
      it "renders a JSON response with the new token" do
        post :create, params: { credentials: valid_attributes }

        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')
        expect(json[:token]).to be_present
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new token" do
        post :create, params: { credentials: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
      end
    end
  end
end
