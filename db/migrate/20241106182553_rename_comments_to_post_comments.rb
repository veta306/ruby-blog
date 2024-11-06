class RenameCommentsToPostComments < ActiveRecord::Migration[7.2]
  def change
    rename_table :comments, :post_comments
  end
end
