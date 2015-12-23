class AddXpositionAndYpositionToUser < ActiveRecord::Migration
  def change
    add_column :users, :Xposition, :integer
    add_column :users, :Yposition, :integer
  end
end
