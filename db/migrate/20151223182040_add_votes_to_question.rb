class AddVotesToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :votes, :integer, default: 0
  end
end
