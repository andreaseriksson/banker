class PaymentRequest < ApplicationRecord
  validates :sender_name, presence: true
  validates :recipient_name, presence: true
  validates :recipient_address, presence: true
  validates :recipient_zip, presence: true
  validates :recipient_city, presence: true
  validates :recipient_country, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :recipient_country, presence: true

  validates :currency, length: { is: 3 }, format: { with: /\A[A-Z]+\z/ }

  validate :validate_amount_larger_than_zero
  validate :validate_iban

  private

  def validate_amount_larger_than_zero
    return if amount.to_f > 0.0

    errors.add(:amount, "must be larger than zero")
  end

  def validate_iban
    iban_object = Ibandit::IBAN.new(iban.to_s)
    return if iban_object.valid?

    errors.add(:iban, "is not a valid iban")
  end
end
