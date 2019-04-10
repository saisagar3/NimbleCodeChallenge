class AddCitizenIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :citizen_id, :integer
  end
end
