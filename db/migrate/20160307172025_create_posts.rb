class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :date
      t.belongs_to :author
      t.text :body

      t.timestamps null: false
    end
  end
end
