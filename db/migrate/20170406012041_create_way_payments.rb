class CreateWayPayments < ActiveRecord::Migration
  def change
    create_table :way_payments do |t|
      t.integer :company_id
      t.datetime :deleted_at
      t.string :name

      t.timestamps null: false
    end
  end
end
