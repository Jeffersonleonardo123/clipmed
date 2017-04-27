class CreateCardOperators < ActiveRecord::Migration
  def change
    create_table :card_operators do |t|
      t.integer :company_id
      t.datetime :deleted_at
      t.string :name

      t.timestamps null: false
    end
  end
end
