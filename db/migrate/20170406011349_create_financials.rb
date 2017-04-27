class CreateFinancials < ActiveRecord::Migration
  def change
    create_table :financials do |t|
      t.integer :company_id
      t.integer :user_id
      t.string :conditions_payments
      t.integer :way_payments_id
      t.integer :client_id
      t.date :date_vencto
      t.string :status
      t.string :category
      t.date :date_receiopt
      t.decimal :value_document
      t.decimal :value_ticket
      t.decimal :interest
      t.decimal :discount
      t.decimal :addition
      t.string :reference
      t.integer :parcel
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
