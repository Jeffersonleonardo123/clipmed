class AddColumnDeletedAtToAgreement < ActiveRecord::Migration
  def change
    add_column :agreements, :deleted_at, :datetime  
  end
end
