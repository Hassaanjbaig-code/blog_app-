class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post

  def update_the_comment_counter
    post.update(commentscounter: post.commentscounter + 1)
  end
end
