class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.string :name
      t.string :email
      t.string :cnpj
      t.string :fone
      t.integer :company_id
      t.integer :number
      t.string :address
      t.string :zip
      t.string :neighborhood
      t.string :city
      t.string :state
      t.text :observation
      t.string :contact
      t.text :site

      t.timestamps null: false
    end
  end
end
