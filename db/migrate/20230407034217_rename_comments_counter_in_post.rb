class RenameCommentsCounterInPost < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :comments_counter, :commentscounter
  end
end
