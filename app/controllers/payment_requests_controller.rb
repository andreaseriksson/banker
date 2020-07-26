class PaymentRequestsController < ApplicationController
  before_action :require_authorization

  def show
    @payment_request = PaymentRequest.find(params[:id])

    render json: @payment_request
  end

  def create
    @payment_request = PaymentRequest.new(payment_request_params)

    if @payment_request.save
      render json: @payment_request, status: :created, location: @payment_request
    else
      render json: @payment_request.errors, status: :unprocessable_entity
    end
  end

  private

  def payment_request_params
    params.require(:payment_request).permit(:recipient_name, :recipient_address, :recipient_zip,
                                            :recipient_city, :recipient_country, :sender_name,
                                            :amount, :currency, :iban, :bic)
  end
end
