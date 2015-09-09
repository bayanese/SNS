class CreateGroupComments < ActiveRecord::Migration
  def change
    create_table :group_comments do |t|
      t.string :title
      t.boolean :done, default: false
      t.references :group, index: true, foreign_key: true
      t.references :group_post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
