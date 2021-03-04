class AddUserIdToVaults < ActiveRecord::Migration[5.2]
  def change
    add_column :vaults, :user_id, :integer
  end
end
