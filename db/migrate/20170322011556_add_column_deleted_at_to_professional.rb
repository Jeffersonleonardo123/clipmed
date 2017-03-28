class AddColumnDeletedAtToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :deleted_at, :datetime  
  end
end
