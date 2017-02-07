class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :cnpj
      t.string :fone
      t.integer :number
      t.string :address
      t.string :zip
      t.string :neighborhood
      t.string :city
      t.string :state
      t.text :observation
      t.string :contact
      t.text :site
      t.text :logo

      t.timestamps null: false
    end
  end
end
