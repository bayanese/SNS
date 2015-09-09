class CreateGroupPostComments < ActiveRecord::Migration
  def change
    create_table :group_post_comments do |t|
      t.string :title
      t.boolean :done, default: false
      t.references :group_post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
