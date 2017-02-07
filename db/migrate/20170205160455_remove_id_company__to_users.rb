class RemoveIdCompanyToUsers < ActiveRecord::Migration
  def change
        remove_column :users, :id_company
  end
end
