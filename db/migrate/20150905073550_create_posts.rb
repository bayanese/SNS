class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id

      t.references :user, null: false
      t.foreign_key :users, dependent: :delete

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
