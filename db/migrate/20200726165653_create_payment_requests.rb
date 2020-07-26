class CreatePaymentRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_requests do |t|
      t.string :recipient_name, null: false
      t.string :recipient_address, null: false
      t.string :recipient_zip, null: false
      t.string :recipient_city, null: false
      t.string :recipient_country, null: false
      t.string :sender_name, null: false
      t.decimal :amount, null: false, precision: 12, scale: 2
      t.string :currency, null: false
      t.string :iban, null: false
      t.string :bic, null: false

      t.timestamps
    end

    add_index :payment_requests, :iban
  end
end
