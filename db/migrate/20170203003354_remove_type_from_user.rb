class RemoveTypeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :type
  end
end
