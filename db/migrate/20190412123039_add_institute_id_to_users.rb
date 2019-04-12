class AddInstituteIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :institute_id, :string
  end
end
