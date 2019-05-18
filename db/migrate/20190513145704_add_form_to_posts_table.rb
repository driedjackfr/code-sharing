class AddFormToPostsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :form, :integer, default: 0, null: false
  end
end
