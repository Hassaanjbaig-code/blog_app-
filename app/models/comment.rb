class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post
  after_save :update_the_post_counter

  private

  def update_the_comment_counter
    post.update(commentscounter: post.commentscounter + 1)
  end
end
