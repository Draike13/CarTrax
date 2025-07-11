class CleanUpUsersTable < ActiveRecord::Migration[8.0]
  def change
    change_table :users do |t|
      t.rename :f_name, :first_name
      t.rename :l_name, :last_name
      t.remove :birthday
    end
  end
end
