class AddXpositionAndYpositionToUser < ActiveRecord::Migration
  def change
    add_column :users, :Xposition, :integer, default: 0
    add_column :users, :Yposition, :integer, default: 0
  end
end
