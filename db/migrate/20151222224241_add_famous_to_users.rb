class AddFamousToUsers < ActiveRecord::Migration
  def change
    add_column :users, :famous, :boolean, default: false
  end
end
