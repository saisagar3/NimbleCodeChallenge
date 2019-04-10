class ChangeCitizenIdToStringInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :citizen_id, :string
  end
end
