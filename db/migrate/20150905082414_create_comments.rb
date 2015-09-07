class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.boolean :done, default: false
      t.references :post, index: true, foreign_key: true
      t.integer :user_id
      t.integer :post_id

      t.references :user, null: false
      t.foreign_key :users, dependent: :delete

      t.timestamps
    end
     add_index :comments, :user_id
  end
end
