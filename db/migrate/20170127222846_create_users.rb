class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :id_company
      t.string :email
      t.string :password
      t.string :encrypted_password
      t.timestamps null: false
    end
  end
end
