require 'rails_helper'

RSpec.describe PaymentRequest, type: :model do
  let(:valid_attributes) { FactoryBot.attributes_for(:payment_request) }

  def validation_object(key_value)
    PaymentRequest.new(valid_attributes.merge(key_value))
  end

  describe 'validations' do
    it 'validates presence on fields' do
      expect(PaymentRequest.new(valid_attributes)).to be_valid

      [:recipient_name, :recipient_address, :recipient_zip,
       :recipient_city, :recipient_country, :sender_name].each do |attr|
        expect(validation_object(attr => nil)).not_to be_valid
      end
    end

    it 'validates currency code as 3 letters uppercase' do
      expect(validation_object(currency: 'USD')).to be_valid
      expect(validation_object(currency: 'US')).not_to be_valid
      expect(validation_object(currency: 'usd')).not_to be_valid
      expect(validation_object(currency: 'USDD')).not_to be_valid
      expect(validation_object(currency: '')).not_to be_valid
      expect(validation_object(currency: nil)).not_to be_valid
      expect(validation_object(currency: 'US1')).not_to be_valid
      expect(validation_object(currency: 'US%')).not_to be_valid
    end

    it 'validated amount as a positive number' do
      expect(validation_object(amount: 100.0)).to be_valid
      expect(validation_object(amount: 0.01)).to be_valid
      expect(validation_object(amount: 100000000.01)).to be_valid
      expect(validation_object(amount: '')).not_to be_valid
      expect(validation_object(amount: nil)).not_to be_valid
      expect(validation_object(amount: -0.01)).not_to be_valid
      expect(validation_object(amount: -100.0)).not_to be_valid
    end

    it 'validates iban numbers' do
      [ "AD1200012030200359100100",
        "AE070331234567890123456",
        "AL47212110090000000235698741",
        "AT611904300234573201",
        "AZ21NABZ00000000137010001944",
        "BA391290079401028494",
        "BE68539007547034",
        "BG80BNBG96611020345678",
        "BH67BMAG00001299123456",
        "BR7724891749412660603618210F3",
        "CH9300762011623852957",
        "CY17002001280000001200527600",
        "CZ6508000000192000145399",
        "DE89370400440532013000",
        "DK5000400440116243",
        "DO28BAGR00000001212453611324",
        "EE382200221020145685",
        "ES9121000418450200051332",
        "FI2112345600000785",
        "FO7630004440960235",
        "FR1420041010050500013M02606",
        "GB29NWBK60161331926819",
        "GE29NB0000000101904917",
        "GI75NWBK000000007099453",
        "GL4330003330229543",
        "GR1601101250000000012300695",
        "GT82TRAJ01020000001210029690",
        "HR1210010051863000160",
        "HU42117730161111101800000000",
        "IE29AIBK93115212345678",
        "IL620108000000099999999",
        "IS140159260076545510730339",
        "IT60X0542811101000000123456",
        "KW81CBKU0000000000001234560101",
        "KZ86125KZT5004100100",
        "LB62099900000001001901229114",
        "LI21088100002324013AA",
        "LT121000011101001000",
        "LU280019400644750000",
        "LV80BANK0000435195001",
        "MC1112739000700011111000h79",
        "MD24AG000225100013104168",
        "ME25505000012345678951",
        "MK07300000000042425",
        "MR1300020001010000123456753",
        "MT84MALT011000012345MTLCAST001S",
        "MU17BOMM0101101030300200000MUR",
        "NL91ABNA0417164300",
        "NO9386011117947",
        "PK36SCBL0000001123456702",
        "PL27114020040000300201355387",
        "PT50000201231234567890154",
        "QA58DOHB00001234567890ABCDEFG",
        "RO49AAAA1B31007593840000",
        "RS35260005601001611379",
        "SA0380000000608010167519",
        "SE3550000000054910000003",
        "SI56191000000123438",
        "SK3112000000198742637541",
        "SM86U0322509800000000270100",
        "TN5914207207100707129648",
        "TR330006100519786457841326",
        "VG96VPVG0000012345678901",
        "XK051212012345678906"
      ].each do |iban_code|
        expect(validation_object(iban: iban_code)).to be_valid
      end
    end

    it 'is not valid vid invalid ibans' do
      expect(validation_object(iban: 'RO7999991B31007593840000')).not_to be_valid
      expect(validation_object(iban: 'SE7999991B3100700')).not_to be_valid
      expect(validation_object(iban: '')).not_to be_valid
      expect(validation_object(iban: nil)).not_to be_valid
    end
  end
end
