class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :payment_amount
      t.references :bank, foreign_key: true

      t.timestamps
    end
  end
end
