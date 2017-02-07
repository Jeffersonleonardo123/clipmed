class AddAdmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :adm, :string
  end
end
