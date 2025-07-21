class AddUserRoleToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :user_role, :string, default: "customer"
  end
end
