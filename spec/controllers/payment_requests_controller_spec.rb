require 'rails_helper'

RSpec.describe PaymentRequestsController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.attributes_for :payment_request
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:payment_request).merge(iban: 'wrong')
  }

  let(:headers) {
    token = JWT.encode({ session: 'some_session_id' }, ApplicationController::SECRET)
    { 'Authorization': "Bearer #{token}" }
  }

  before do
    request.headers.merge! headers
  end

  describe "GET #show" do
    it "returns a success response" do
      payment_request = PaymentRequest.create! valid_attributes
      get :show, params: { id: payment_request.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new PaymentRequest" do
        expect {
          post :create, params: { payment_request: valid_attributes }
        }.to change(PaymentRequest, :count).by(1)
      end

      it "renders a JSON response with the new payment_request" do
        post :create, params: { payment_request: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')
        expect(response.location).to eq(payment_request_url(PaymentRequest.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new payment_request" do
        post :create, params: { payment_request: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
      end
    end
  end
end
