class AddDefaultXAndYToUser < ActiveRecord::Migration
  def change
    change_column :users, :Xposition, :integer, :default => 0
    change_column :users, :Yposition, :integer, :default => 0
  end
end
