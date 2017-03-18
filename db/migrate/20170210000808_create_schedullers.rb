class CreateSchedullers < ActiveRecord::Migration
  def change
    create_table :schedullers do |t|
      t.integer :company_id
      t.integer :client_id
      t.integer :user_id
      t.integer :professional_id
      t.date :date
      t.time :time_marked
      t.time :time_marked_end
      t.string :celphone
      t.string :phone
      t.string :name
      t.text :observation
      t.text :status
      t.string :agreement_id
      t.string :tipo_atendimento
      t.timestamps null: false
    end
  end
end
