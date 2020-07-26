FactoryBot.define do
  factory :payment_request do
    recipient_name { 'Jane Doe' }
    recipient_address { 'Some way 1' }
    recipient_zip { '25000' }
    recipient_city { 'Malmö' }
    recipient_country { 'Sweden' }
    sender_name { 'John Doe' }
    amount { "9.99" }
    currency { 'SEK' }
    iban { 'SE3550000000054910000003' }
    bic { 'NDEASESS' }
  end
end
