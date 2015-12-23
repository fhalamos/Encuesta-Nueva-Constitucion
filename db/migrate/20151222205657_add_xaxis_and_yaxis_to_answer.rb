class AddXaxisAndYaxisToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :Xaxis, :integer
    add_column :answers, :Yaxis, :integer
  end
end
