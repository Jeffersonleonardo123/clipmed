class AddColumnRestartLoginToUser < ActiveRecord::Migration
  def change
    add_column :users, :restart_login, :string
  end
end
