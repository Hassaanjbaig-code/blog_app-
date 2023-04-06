class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_the_comment_counter

  def update_the_comment_counter
    Post.update(commentscounter: post.comments.count)
  end
end
