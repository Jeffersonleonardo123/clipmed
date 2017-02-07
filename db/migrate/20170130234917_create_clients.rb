class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.string :celular
      t.string :fone
      t.integer :company_id
      t.integer :number
      t.string :address
      t.string :zip
      t.string :neighborhood
      t.string :city
      t.string :state
      t.text :observation
      t.string :situation

      t.timestamps null: false
    end
  end
end
