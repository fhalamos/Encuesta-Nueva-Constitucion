class CreatePostits < ActiveRecord::Migration
  def change
    create_table :postits do |t|
      t.text :content
      t.timestamps null: false
    end
  end
end
