class AddProfessionalIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :professional_id, :integer
  end
end
